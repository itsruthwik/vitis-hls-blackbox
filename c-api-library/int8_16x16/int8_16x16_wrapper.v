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


    // State machine for streaming operation
    localparam IDLE = 4'd0;
    localparam STREAM = 4'd1;
    localparam DONE = 4'd2;

    reg [3:0] state;
    
    // Ping-pong buffers for 2 rows of A and 2 columns of B (overlapped I/O with compute)
    // Each buffer holds 2 rows/columns (256 bits = 2 * 128-bit)
    (* ram_style = "distributed" *) reg [255:0] a_buffer_0;  // Buffer bank 0: 2 rows of A
    (* ram_style = "distributed" *) reg [255:0] a_buffer_1;  // Buffer bank 1: 2 rows of A
    (* ram_style = "distributed" *) reg [255:0] b_buffer_0;  // Buffer bank 0: 2 columns of B
    (* ram_style = "distributed" *) reg [255:0] b_buffer_1;  // Buffer bank 1: 2 columns of B
    
    // Small output buffer for 4 rows of results (256-bit wide, so 4 * 256 = 1024 bits)
    (* ram_style = "distributed" *) reg [1023:0] c_buffer;  // Stores last 4 result rows
    
    reg [4:0] a_row_count, b_col_count;  // Received rows/columns (0-15)
    reg [4:0] c_row_count;  // Output rows (0-15)
    reg [1:0] a_bank, b_bank;  // Current buffer bank selector
    
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
    
    // Compute operation counter
    reg [6:0] operation_count;
    reg [3:0] row_idx, col_idx;  // Which 8x8 sub-block (0-3 for 2x2 grid)
    
    // AXI Stream handshake - always ready during STREAM state
    assign a_tready = (state == STREAM);
    assign b_tready = (state == STREAM);
    
    
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
    
    
    // State machine for streaming 16x16 computation with overlapped I/O
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            a_row_count <= 5'd0;
            b_col_count <= 5'd0;
            c_row_count <= 5'd0;
            operation_count <= 7'd0;
            row_idx <= 4'd0;
            col_idx <= 4'd0;
            a_bank <= 2'd0;
            b_bank <= 2'd0;
            c_tvalid <= 1'b0;
        end else if (ap_ce) begin
            case (state)
                IDLE: begin
                    if (ap_start) begin
                        state <= STREAM;
                        a_row_count <= 5'd0;
                        b_col_count <= 5'd0;
                        c_row_count <= 5'd0;
                        operation_count <= 7'd0;
                        row_idx <= 4'd0;
                        col_idx <= 4'd0;
                        a_bank <= 2'd0;
                        b_bank <= 2'd0;
                        c_tvalid <= 1'b0;
                    end
                end
                
                // Streaming phase: receive A/B, compute, and send C concurrently
                STREAM: begin
                    // Receive matrix A rows (ping-pong buffering)
                    if (a_tvalid) begin
                        if (a_bank == 2'd0) begin
                            a_buffer_0 <= a_tdata;
                        end else begin
                            a_buffer_1 <= a_tdata;
                        end
                        
                        if (a_row_count == 5'd15) begin
                            a_row_count <= 5'd0;
                        end else begin
                            a_row_count <= a_row_count + 1;
                            if (a_row_count[0]) begin
                                a_bank <= a_bank + 1;
                            end
                        end
                    end
                    
                    // Receive matrix B columns (ping-pong buffering)
                    if (b_tvalid) begin
                        if (b_bank == 2'd0) begin
                            b_buffer_0 <= b_tdata;
                        end else begin
                            b_buffer_1 <= b_tdata;
                        end
                        
                        if (b_col_count == 5'd15) begin
                            b_col_count <= 5'd0;
                        end else begin
                            b_col_count <= b_col_count + 1;
                            if (b_col_count[0]) begin
                                b_bank <= b_bank + 1;
                            end
                        end
                    end
                    
                    // Compute logic: process 8x8 blocks
                    if (operation_count < 64) begin
                        case (row_idx)
                            4'd0: begin
                                a_row_0 <= a_buffer_0[63:0];
                                a_row_1 <= a_buffer_0[127:64];
                            end
                            4'd1: begin
                                a_row_0 <= a_buffer_0[191:128];
                                a_row_1 <= a_buffer_0[255:192];
                            end
                            4'd2: begin
                                a_row_0 <= a_buffer_1[63:0];
                                a_row_1 <= a_buffer_1[127:64];
                            end
                            4'd3: begin
                                a_row_0 <= a_buffer_1[191:128];
                                a_row_1 <= a_buffer_1[255:192];
                            end
                            default: begin
                                a_row_0 <= 64'd0;
                                a_row_1 <= 64'd0;
                            end
                        endcase
                        
                        case (col_idx)
                            4'd0: begin
                                b_col_0 <= b_buffer_0[63:0];
                                b_col_1 <= b_buffer_0[127:64];
                            end
                            4'd1: begin
                                b_col_0 <= b_buffer_0[191:128];
                                b_col_1 <= b_buffer_0[255:192];
                            end
                            4'd2: begin
                                b_col_0 <= b_buffer_1[63:0];
                                b_col_1 <= b_buffer_1[127:64];
                            end
                            4'd3: begin
                                b_col_0 <= b_buffer_1[191:128];
                                b_col_1 <= b_buffer_1[255:192];
                            end
                            default: begin
                                b_col_0 <= 64'd0;
                                b_col_1 <= 64'd0;
                            end
                        endcase
                        
                        // Wait for all 4 slices to complete
                        if (&done_slice) begin
                            operation_count <= operation_count + 1;
                            
                            // Store 4 result rows (256-bit each = 1024 bits total)
                            c_buffer <= {c_out[3], c_out[2], c_out[1], c_out[0]};
                            
                            // Increment indices for next 8x8 block
                            if (col_idx == 4'd3) begin
                                col_idx <= 4'd0;
                                if (row_idx == 4'd3) begin
                                    row_idx <= 4'd0;
                                end else begin
                                    row_idx <= row_idx + 1;
                                end
                            end else begin
                                col_idx <= col_idx + 1;
                            end
                        end
                    end
                    
                    // Output results as they become available
                    if (operation_count > 0 && c_tready) begin
                        case (c_row_count[1:0])
                            2'd0: c_tdata <= c_buffer[255:0];
                            2'd1: c_tdata <= c_buffer[511:256];
                            2'd2: c_tdata <= c_buffer[767:512];
                            2'd3: c_tdata <= c_buffer[1023:768];
                            default: c_tdata <= 256'd0;
                        endcase
                        c_tvalid <= 1'b1;
                        
                        if (c_row_count == 5'd15) begin
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
    assign start_slice = {4{(state == STREAM && operation_count < 64)}};
    assign ap_done = (state == DONE);
    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);

endmodule
