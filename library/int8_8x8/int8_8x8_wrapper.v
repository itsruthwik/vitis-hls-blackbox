`timescale 1ns / 1ps

// 8x8 matrix multiplication wrapper using 1 8x8 tensor slice
// AXI Stream interface: 8 transfers of 64-bit rows/columns for inputs, 128-bit rows for output
// Implements single 8x8 tensor slice

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


    // State machine for AXI Stream control
    localparam IDLE = 4'd0;
    localparam RECV_A = 4'd1;
    localparam RECV_B = 4'd2;
    localparam COMPUTE = 4'd3;
    localparam SEND_C = 4'd4;
    localparam DONE = 4'd5;

    reg [3:0] state;
    
    // Buffering for matrix rows/columns - flattened to match 16x16 style
    (* ram_style = "distributed" *) reg [511:0] a_matrix_buffer;  // Buffer for all 8 rows of A (64-bit each = 512 bits total)
    (* ram_style = "distributed" *) reg [511:0] b_matrix_buffer;  // Buffer for all 8 columns of B (64-bit each = 512 bits total)
    (* ram_style = "distributed" *) reg [1023:0] c_matrix_buffer;  // Buffer for all 8 result rows (128-bit each = 1024 bits total)
    
    reg [2:0] a_row_count, b_row_count;  // Count received rows/columns
    reg [2:0] c_row_count;  // Count output rows
    
    // Single tensor slice
    wire [0:0] start_slice;
    wire [0:0] done_slice;
    wire [0:0] c_available_slice;
    
    // Internal signals
    wire [127:0] c_out [0:0]; // C data outputs from the slice (128-bit)
    
    // Compute operation counter for orchestrating 64 slice operations (8x8 per slice)
    reg [6:0] operation_count;
    reg [3:0] row_idx, col_idx;  // Which 8x8 block we're processing
    
    // AXI Stream handshake
    assign a_tready = (state == RECV_A);
    assign b_tready = (state == RECV_B);
    
    
    // Current row and column inputs to tensor slice
    reg [63:0] a_row_0;  // for i=0
    reg [63:0] a_row_1;  // for i=1 (unused, set to 0)
    reg [63:0] b_col_0;  // for j=0
    reg [63:0] b_col_1;  // for j=1 (unused, set to 0)
    
    // Generate tensor slice instance
    genvar i, j, k;
    
    generate
        for (i = 0; i < 1; i = i + 1) begin : gen_rows
            for (j = 0; j < 1; j = j + 1) begin : gen_cols
                localparam slice_idx = i * 1 + j;
                
                // No chaining for 8x8
                wire [63:0] a_in = 64'd0;
                wire [63:0] b_in = 64'd0;
                
    (* black_box = "true" *) (* keep = "true" *) tensor_slice_int8 slice (
                    .clk(ap_clk),
                    .reset(ap_rst),
                    .pe_reset(1'b0),
                    .start_mat_mul(start_slice[slice_idx]),
                    .done_mat_mul(done_slice[slice_idx]),
                    .a_data(a_row_0),         // Row i of input A
                    .b_data(b_col_0),         // Column j of input B
                    .a_data_in(a_in),          // No chain
                    .b_data_in(b_in),          // No chain
                    .c_data_out(c_out[slice_idx]),
                    .a_data_out(),  // No chain
                    .b_data_out(),  // No chain
                    .flags(),
                    .c_data_available(c_available_slice[slice_idx]),
                    .extra_out(),
                    .validity_mask_a_rows(8'hFF),
                    .validity_mask_a_cols_b_rows(8'hFF),
                    .validity_mask_b_cols(8'hFF),
                    .slice_dtype(2'd0),     // int8
                    .slice_mode(1'b0),      // tensor mode
                    .op(3'd0),              // mat mul
                    .preload(1'b0),
                    .no_rounding(1'b0),
                    .final_mat_mul_size(8'd8),
                    .a_loc({i, 3'd0}),
                    .b_loc({j, 3'd0})
                );
            end
        end
    endgenerate

    // State machine for streaming 8x8 computation
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            a_row_count <= 3'd0;
            b_row_count <= 3'd0;
            c_row_count <= 3'd0;
            operation_count <= 7'd0;
            row_idx <= 4'd0;
            col_idx <= 4'd0;
            c_tvalid <= 1'b0;
        end else if (ap_ce) begin
            case (state)
                IDLE: begin
                    if (ap_start) begin
                        state <= RECV_A;
                        a_row_count <= 3'd0;
                        b_row_count <= 3'd0;
                        c_row_count <= 3'd0;
                        operation_count <= 7'd0;
                        c_tvalid <= 1'b0;
                    end
                end
                
                // Receive all 8 rows of matrix A
                RECV_A: begin
                    if (a_tvalid) begin
                        a_matrix_buffer[(a_row_count*64) +: 64] <= a_tdata;
                        if (a_row_count == 3'd7) begin
                            state <= RECV_B;
                            b_row_count <= 3'd0;
                        end else begin
                            a_row_count <= a_row_count + 1;
                        end
                    end
                end
                
                // Receive all 8 columns of matrix B
                RECV_B: begin
                    if (b_tvalid) begin
                        b_matrix_buffer[(b_row_count*64) +: 64] <= b_tdata;
                        if (b_row_count == 3'd7) begin
                            state <= COMPUTE;
                            operation_count <= 7'd0;
                            row_idx <= 4'd0;
                            col_idx <= 4'd0;
                        end else begin
                            b_row_count <= b_row_count + 1;
                        end
                    end
                end
                
                // Compute: orchestrate 64 operations for the single slice
                COMPUTE: begin
                    if (&done_slice) begin  // Slice done
                        operation_count <= operation_count + 1;
                        
                        // Aggregate result into c_buffer
                        c_matrix_buffer[(row_idx*128) +: 128] <= c_out[0];
                        
                        if (operation_count == 63) begin
                            state <= SEND_C;
                            c_row_count <= 3'd0;
                        end
                        
                        // Increment indices
                        if (col_idx == 4'd7) begin
                            col_idx <= 4'd0;
                            row_idx <= row_idx + 1;
                        end else begin
                            col_idx <= col_idx + 1;
                        end
                    end else if (state == COMPUTE) begin
                        // Issue start signal to slice with current row/col
                        a_row_0 <= a_matrix_buffer[(row_idx*64) +: 64];
                        a_row_1 <= 64'd0;  // Unused
                        b_col_0 <= b_matrix_buffer[(col_idx*64) +: 64];
                        b_col_1 <= 64'd0;  // Unused
                    end
                end
                
                // Send result matrix C row by row (128-bit rows)
                SEND_C: begin
                    if (c_tready) begin
                        c_tdata <= c_matrix_buffer[(c_row_count*128) +: 128];
                        c_tvalid <= 1'b1;
                        
                        if (c_row_count == 7) begin
                            state <= DONE;
                        end else begin
                            c_row_count <= c_row_count + 1;
                        end
                    end
                end
                
                DONE: begin
                    c_tvalid <= 1'b0;
                    if (ap_continue) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
    
    // Control signals for HLS protocol
    assign start_slice = {(state == COMPUTE && operation_count < 64)};
    assign ap_done = (state == DONE);
    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);

endmodule
