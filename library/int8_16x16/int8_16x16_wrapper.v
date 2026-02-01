`timescale 1ns / 1ps

// 16x16 matrix multiplication wrapper using 4 8x8 tensor slices with chaining
// AXI Stream interface: 16 transfers of 128-bit rows/columns for inputs, 256-bit rows for output
// Implements 2x2 grid of 8x8 tensor slices with horizontal (A) and vertical (B) chaining

module int8_16x16_wrapper(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    // AXI Stream input for matrix A (16 transfers of 128-bit rows)
    input [127:0] a_tdata,
    input a_tvalid,
    output a_tready,

    // AXI Stream input for matrix B (16 transfers of 128-bit columns)
    input [127:0] b_tdata,
    input b_tvalid,
    output b_tready,

    // AXI Stream output for matrix C (16 transfers of 256-bit rows)
    output reg [255:0] c_tdata,
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
    
    // Buffering for matrix rows/columns - flattened to match 8x8 style
    (* ram_style = "distributed" *) reg [2047:0] a_matrix_buffer;  // Buffer for all 16 rows of A (128-bit each = 2048 bits total)
    (* ram_style = "distributed" *) reg [2047:0] b_matrix_buffer;  // Buffer for all 16 columns of B (128-bit each = 2048 bits total)
    (* ram_style = "distributed" *) reg [4095:0] c_matrix_buffer;  // Buffer for all 16 result rows (256-bit each = 4096 bits total)
    
    reg [4:0] a_row_count, b_row_count;  // Count received rows/columns
    reg [4:0] c_row_count;  // Count output rows
    
    // Four tensor slices for 2x2 block arrangement
    // Grid layout:
    //   [Slice_0,0] [Slice_0,1]
    //   [Slice_1,0] [Slice_1,1]
    
    wire [3:0] start_slice;
    wire [3:0] done_slice;
    wire [3:0] c_available_slice;
    
    // Internal signals for chaining between slices
    wire [63:0] a_out [0:3];  // A chain outputs from each slice (64-bit rows)
    wire [63:0] b_out [0:3];  // B chain outputs from each slice (64-bit cols)
    wire [127:0] c_out [0:3]; // C data outputs from each slice (128-bit)
    
    // Compute operation counter for orchestrating 64 slice operations (8x8 per slice)
    reg [6:0] operation_count;
    reg [3:0] row_idx, col_idx;  // Which 8x8 block we're processing
    
    // AXI Stream handshake
    assign a_tready = (state == RECV_A);
    assign b_tready = (state == RECV_B);
    
    
    // Current row and column inputs to tensor slices
    reg [63:0] a_row_0;  // for i=0
    reg [63:0] a_row_1;  // for i=1
    reg [63:0] b_col_0;  // for j=0
    reg [63:0] b_col_1;  // for j=1
    
    // Generate tensor slice instances with proper chaining
    genvar i, j, k;
    
    generate
        for (i = 0; i < 2; i = i + 1) begin : gen_rows
            for (j = 0; j < 2; j = j + 1) begin : gen_cols
                localparam slice_idx = i * 2 + j;
                
                // A chaining: left input (from column to left or external)
                wire [63:0] a_in = (j == 0) ? 64'd0 : a_out[i * 2 + (j - 1)];
                // B chaining: top input (from row above or external)
                wire [63:0] b_in = (i == 0) ? 64'd0 : b_out[(i - 1) * 2 + j];
                
    (* black_box = "true" *) (* keep = "true" *) tensor_slice_int8 slice (
                    .clk(ap_clk),
                    .reset(ap_rst),
                    .pe_reset(1'b0),
                    .start_mat_mul(start_slice[slice_idx]),
                    .done_mat_mul(done_slice[slice_idx]),
                    .a_data(i == 0 ? a_row_0 : a_row_1),         // Row i of input A
                    .b_data(j == 0 ? b_col_0 : b_col_1),         // Column j of input B
                    .a_data_in(a_in),          // Chain from left (AIN)
                    .b_data_in(b_in),          // Chain from top (BIN)
                    .c_data_out(c_out[slice_idx]),
                    .a_data_out(a_out[slice_idx]),  // To right slice (AOUT)
                    .b_data_out(b_out[slice_idx]),  // To bottom slice (BOUT)
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
    
    
    // State machine for streaming 16x16 computation
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            a_row_count <= 5'd0;
            b_row_count <= 5'd0;
            c_row_count <= 5'd0;
            operation_count <= 7'd0;
            row_idx <= 4'd0;
            col_idx <= 4'd0;
            c_tvalid <= 1'b0;
        end else if (ap_ce) begin
            case (state)
                IDLE: begin
                    if (ap_start) begin
                        state <= RECV_A;
                        a_row_count <= 5'd0;
                        b_row_count <= 5'd0;
                        c_row_count <= 5'd0;
                        operation_count <= 7'd0;
                        c_tvalid <= 1'b0;
                    end
                end
                
                // Receive all 16 rows of matrix A
                RECV_A: begin
                    if (a_tvalid) begin
                        a_matrix_buffer[(a_row_count*128) +: 128] <= a_tdata;
                        if (a_row_count == 5'd15) begin
                            state <= RECV_B;
                            b_row_count <= 5'd0;
                        end else begin
                            a_row_count <= a_row_count + 1;
                        end
                    end
                end
                
                // Receive all 16 columns of matrix B
                RECV_B: begin
                    if (b_tvalid) begin
                        b_matrix_buffer[(b_row_count*128) +: 128] <= b_tdata;
                        if (b_row_count == 5'd15) begin
                            state <= COMPUTE;
                            operation_count <= 7'd0;
                            row_idx <= 4'd0;
                            col_idx <= 4'd0;
                        end else begin
                            b_row_count <= b_row_count + 1;
                        end
                    end
                end
                
                // Compute: orchestrate 4 tensor slices for all 64 operations
                COMPUTE: begin
                    if (&done_slice) begin  // All 4 slices done
                        operation_count <= operation_count + 1;
                        
                        // Store results from all 4 slices into c_matrix_buffer
                        // For 2x2 grid computing 8x8 blocks:
                        // Block[0,0]: rows 0-7, columns 0-7 from slice 0
                        // Block[0,1]: rows 0-7, columns 8-15 from slice 1  
                        // Block[1,0]: rows 8-15, columns 0-7 from slice 2
                        // Block[1,1]: rows 8-15, columns 8-15 from slice 3
                        c_matrix_buffer[(row_idx*256) +: 128] <= c_out[0];        // Block[0,0] - columns 0:7
                        c_matrix_buffer[(row_idx*256 + 128) +: 128] <= c_out[1];  // Block[0,1] - columns 8:15
                        c_matrix_buffer[((row_idx + 8)*256) +: 128] <= c_out[2]; // Block[1,0] - row+8, columns 0:7
                        c_matrix_buffer[((row_idx + 8)*256 + 128) +: 128] <= c_out[3]; // Block[1,1] - row+8, columns 8:15
                        
                        if (operation_count == 63) begin
                            state <= SEND_C;
                            c_row_count <= 5'd0;
                        end
                        
                        // Increment indices for next operation
                        if (col_idx == 4'd7) begin
                            col_idx <= 4'd0;
                            row_idx <= row_idx + 1;
                        end else begin
                            col_idx <= col_idx + 1;
                        end
                    end else if (state == COMPUTE) begin
                        // Issue start signal to all slices with current row/col
                        a_row_0 <= a_matrix_buffer[(row_idx*128) +: 64];
                        a_row_1 <= a_matrix_buffer[((row_idx + 8)*128) +: 64];
                        b_col_0 <= b_matrix_buffer[(col_idx*128) +: 64];
                        b_col_1 <= b_matrix_buffer[((col_idx + 8)*128) +: 64];
                    end
                end
                
                // Send result matrix C row by row (128-bit rows)
                SEND_C: begin
                    if (c_tready) begin
                        c_tdata <= c_matrix_buffer[(c_row_count*256) +: 256];
                        c_tvalid <= 1'b1;
                        
                        if (c_row_count == 15) begin
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
    assign start_slice = {4{(state == COMPUTE && operation_count < 64)}};
    assign ap_done = (state == DONE);
    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);

endmodule
