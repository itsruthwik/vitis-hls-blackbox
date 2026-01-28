`timescale 1ns / 1ps

module int8_8x8_wrapper(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    // AXI Stream input for matrix A (8 transfers of 64-bit rows)
    input [63:0] a_tdata,
    input a_tvalid,
    output a_tready,

    // AXI Stream input for matrix B (8 transfers of 64-bit columns)
    input [63:0] b_tdata,
    input b_tvalid,
    output b_tready,

    // AXI Stream output for matrix C (8 transfers of 128-bit rows)
    output reg [127:0] c_tdata,
    output reg c_tvalid,
    input c_tready
);

    // Systolic array signals for current operation
    reg start_systolic;
    wire done_systolic;
    wire ts_c_data_available;
    wire [127:0] ts_c_data_out;
    
    // Matrix storage and iteration
    reg [63:0] a_row;  // Current row of A
    reg [63:0] b_col;  // Current column of B
    reg [1023:0] c_matrix;  // Accumulated result matrix
    reg [3:0] row_idx, col_idx;  // Matrix indices (0-7)
    
    // Control signals
    reg pe_reset_sig;
    
    // Input buffering
    reg [511:0] a_matrix_buffer;  // Buffer for all 8 rows of A
    reg [511:0] b_matrix_buffer;  // Buffer for all 8 rows of B
    reg [2:0] a_row_count, b_row_count;  // Count received rows
    
    // Instantiate tensor_slice primitive (accepts one row/column at a time)
    tensor_slice_int8 ts (
        .clk(ap_clk),
        .reset(ap_rst),
        .pe_reset(pe_reset_sig),
        .start_mat_mul(start_systolic),
        .done_mat_mul(done_systolic),
        .a_data(a_row),     // Current row of A
        .b_data(b_col),     // Current column of B
        .a_data_in(64'd0),
        .b_data_in(64'd0),
        .c_data_out(ts_c_data_out),
        .a_data_out(),
        .b_data_out(),
        .flags(),
        .c_data_available(ts_c_data_available),
        .extra_out(),
        .validity_mask_a_rows(8'hFF),
        .validity_mask_a_cols_b_rows(8'hFF),
        .validity_mask_b_cols(8'hFF),
        .slice_dtype(2'b00),
        .slice_mode(1'b0),
        .op(3'b000),
        .preload(1'b0),
        .no_rounding(1'b0),
        .final_mat_mul_size(8'd8),
        .a_loc(5'd0),
        .b_loc(5'd0)
    );

    // Control logic for 8x8 matrix multiplication with AXI Stream
    reg [3:0] state;
    localparam IDLE = 4'd0;
    localparam RECV_A = 4'd1;
    localparam RECV_B = 4'd2;
    localparam LOAD_INPUTS = 4'd3;
    localparam COMPUTE = 4'd4;
    localparam WAIT_RESULT = 4'd5;
    localparam SEND_C = 4'd6;
    localparam DONE = 4'd7;
    
    reg [6:0] operation_count;  // Total operations = 64 (8x8)
    reg [2:0] c_row_count;  // Count output rows
    reg result_valid;
    
    // AXI Stream handshake signals
    assign a_tready = (state == RECV_A);
    assign b_tready = (state == RECV_B);
    
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            start_systolic <= 1'b0;
            pe_reset_sig <= 1'b0;
            operation_count <= 7'd0;
            row_idx <= 4'd0;
            col_idx <= 4'd0;
            c_matrix <= 1024'd0;
            result_valid <= 1'b0;
            a_row_count <= 3'd0;
            b_row_count <= 3'd0;
            c_row_count <= 3'd0;
            c_tvalid <= 1'b0;
        end else if (ap_ce) begin
            case (state)
                IDLE: begin
                    if (ap_start) begin
                        state <= RECV_A;
                        a_row_count <= 3'd0;
                        b_row_count <= 3'd0;
                        c_row_count <= 3'd0;
                        a_matrix_buffer <= 512'd0;
                        b_matrix_buffer <= 512'd0;
                        c_matrix <= 1024'd0;
                        operation_count <= 7'd0;
                        result_valid <= 1'b0;
                        c_tvalid <= 1'b0;
                    end
                end
                
                // Receive matrix A row by row
                RECV_A: begin
                    if (a_tvalid) begin
                        a_matrix_buffer[(a_row_count*64) +: 64] <= a_tdata;
                        if (a_row_count == 3'd7) begin
                            state <= RECV_B;
                        end else begin
                            a_row_count <= a_row_count + 1;
                        end
                    end
                end
                
                // Receive matrix B column by column
                RECV_B: begin
                    if (b_tvalid) begin
                        b_matrix_buffer[(b_row_count*64) +: 64] <= b_tdata;
                        if (b_row_count == 3'd7) begin
                            state <= LOAD_INPUTS;
                            row_idx <= 4'd0;
                            col_idx <= 4'd0;
                        end else begin
                            b_row_count <= b_row_count + 1;
                        end
                    end
                end
                
                // Load inputs for computation
                LOAD_INPUTS: begin
                    a_row <= a_matrix_buffer[(row_idx*64) +: 64];
                    b_col <= b_matrix_buffer[(col_idx*64) +: 64];
                    state <= COMPUTE;
                end
                
                COMPUTE: begin
                    start_systolic <= 1'b1;
                    state <= WAIT_RESULT;
                end
                
                WAIT_RESULT: begin
                    start_systolic <= 1'b0;
                    
                    if (done_systolic && ts_c_data_available) begin
                        // Store result in the appropriate position
                        c_matrix[(row_idx*128) +: 128] <= ts_c_data_out;
                        operation_count <= operation_count + 1;
                        
                        if (col_idx == 4'd7) begin
                            // Finished row, move to next row
                            row_idx <= row_idx + 1;
                            col_idx <= 4'd0;
                        end else begin
                            // Move to next column
                            col_idx <= col_idx + 1;
                        end
                        
                        if (operation_count == 7'd63) begin
                            // All 64 operations complete
                            state <= SEND_C;
                            result_valid <= 1'b1;
                            c_row_count <= 3'd0;
                        end else begin
                            state <= LOAD_INPUTS;
                        end
                    end
                end
                
                // Send result matrix C row by row via AXI Stream
                SEND_C: begin
                    if (c_tready && c_tvalid) begin
                        c_row_count <= c_row_count + 1;
                        if (c_row_count == 3'd7) begin
                            state <= DONE;
                            c_tvalid <= 1'b0;
                        end
                    end
                    
                    if (!c_tvalid && result_valid) begin
                        c_tvalid <= 1'b1;
                        c_tdata <= c_matrix[(c_row_count*128) +: 128];
                    end
                end
                
                DONE: begin
                    if (ap_continue) begin
                        state <= IDLE;
                        c_tvalid <= 1'b0;
                    end
                end
            endcase
        end
    end

    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);
    assign ap_done = (state == DONE);

endmodule
