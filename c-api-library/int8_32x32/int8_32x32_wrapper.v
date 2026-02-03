`timescale 1ns / 1ps

// 32x32 matrix multiplication wrapper using 16 8x8 tensor slices with chaining
// AXI Stream interface: 32 transfers of 256-bit rows/columns for inputs, 512-bit rows for output
// Implements 4x4 grid of 8x8 tensor slices with horizontal (A) and vertical (B) chaining
// Optimized for streaming with ping-pong buffering (no full matrix buffering)

module int8_32x32_wrapper(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    // AXI Stream input for matrix A (32 transfers of 256-bit rows)
    input [255:0] a_tdata,
    input a_tvalid,
    output a_tready,

    // AXI Stream input for matrix B (32 transfers of 256-bit columns)
    input [255:0] b_tdata,
    input b_tvalid,
    output b_tready,

    // AXI Stream output for matrix C (32 transfers of 512-bit rows)
    output reg [511:0] c_tdata,
    output reg c_tvalid,
    input c_tready
);

    // State machine for streaming operation
    localparam IDLE = 4'd0;
    localparam STREAM = 4'd1;
    localparam SEND_C = 4'd2;
    localparam DONE = 4'd3;

    reg [3:0] state;
    
    // Ping-pong buffers for 2 rows of A and 2 columns of B (overlapped I/O with compute)
    // Each buffer holds 2 rows/columns (512 bits = 2 * 256-bit)
    (* ram_style = "distributed" *) reg [511:0] a_buffer_0;  // Buffer bank 0: 2 rows of A
    (* ram_style = "distributed" *) reg [511:0] a_buffer_1;  // Buffer bank 1: 2 rows of A
    (* ram_style = "distributed" *) reg [511:0] b_buffer_0;  // Buffer bank 0: 2 columns of B
    (* ram_style = "distributed" *) reg [511:0] b_buffer_1;  // Buffer bank 1: 2 columns of B
    
    // Small output buffer for 4 rows of results (512-bit wide, so 4 * 512 = 2048 bits)
    (* ram_style = "distributed" *) reg [2047:0] c_buffer;  // Stores last 4 result rows
    
    reg [5:0] a_row_count, b_col_count;  // Received rows/columns (0-31)
    reg [5:0] c_row_count;  // Output rows (0-31)
    reg [1:0] a_bank, b_bank;  // Current buffer bank selector
    
    // Tensor slice interconnect - FLATTENED 1D arrays (no 2D for synthesis)
    wire [1023:0] a_out_flat;  // 16 slices * 64 bits = 1024 bits
    wire [1023:0] b_out_flat;  // 16 slices * 64 bits = 1024 bits
    wire [2047:0] c_out_flat;  // 16 slices * 128 bits = 2048 bits
    
    wire [15:0] start_slice;
    wire [15:0] done_slice;
    wire [15:0] c_available_slice;
    
    // Extract individual slice signals from flattened arrays
    wire [63:0] a_row_0, a_row_1, a_row_2, a_row_3;
    wire [63:0] b_col_0, b_col_1, b_col_2, b_col_3;
    reg [63:0] a_row_0_in, a_row_1_in, a_row_2_in, a_row_3_in;
    reg [63:0] b_col_0_in, b_col_1_in, b_col_2_in, b_col_3_in;
    
    // Compute operation counter
    reg [6:0] operation_count;
    reg [3:0] row_idx, col_idx;  // Which 8x8 sub-block (0-7)
    
    // AXI Stream handshake - always ready during STREAM state
    assign a_tready = (state == STREAM);
    assign b_tready = (state == STREAM);
    
    // Generate tensor slice instances with proper chaining (4x4 grid)
    genvar i, j;
    
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_rows
            for (j = 0; j < 4; j = j + 1) begin : gen_cols
                localparam slice_idx = i * 4 + j;
                
                // A chaining: left input from previous slice or 0
                wire [63:0] a_in = (j == 0) ? 64'd0 : a_out_flat[(j-1)*64+63:(j-1)*64];
                // B chaining: top input from previous slice or 0
                wire [63:0] b_in = (i == 0) ? 64'd0 : b_out_flat[((i-1)*4+j)*64+63:((i-1)*4+j)*64];
                
                // Extract A/B inputs based on row/col index
                wire [63:0] a_data_mux = (i == 0) ? a_row_0_in : 
                                          (i == 1) ? a_row_1_in :
                                          (i == 2) ? a_row_2_in : a_row_3_in;
                wire [63:0] b_data_mux = (j == 0) ? b_col_0_in :
                                          (j == 1) ? b_col_1_in :
                                          (j == 2) ? b_col_2_in : b_col_3_in;
                
    (* black_box = "true" *) (* keep = "true" *) tensor_slice_int8 slice (
                    .clk(ap_clk),
                    .reset(ap_rst),
                    .pe_reset(1'b0),
                    .start_mat_mul(start_slice[slice_idx]),
                    .done_mat_mul(done_slice[slice_idx]),
                    .a_data(a_data_mux),
                    .b_data(b_data_mux),
                    .a_data_in(a_in),          // Chain from left (AIN)
                    .b_data_in(b_in),          // Chain from top (BIN)
                    .c_data_out(c_out_flat[slice_idx*128+127:slice_idx*128]),
                    .a_data_out(a_out_flat[slice_idx*64+63:slice_idx*64]),  // To right slice (AOUT)
                    .b_data_out(b_out_flat[slice_idx*64+63:slice_idx*64]),  // To bottom slice (BOUT)
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
    
    // State machine for streaming 32x32 computation with overlapped I/O
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            a_row_count <= 6'd0;
            b_col_count <= 6'd0;
            c_row_count <= 6'd0;
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
                        a_row_count <= 6'd0;
                        b_col_count <= 6'd0;
                        c_row_count <= 6'd0;
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
                        
                        if (a_row_count == 6'd31) begin
                            // Last row received - stop receiving A
                            a_row_count <= 6'd0;
                        end else begin
                            a_row_count <= a_row_count + 1;
                            // Toggle bank every 2 rows
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
                        
                        if (b_col_count == 6'd31) begin
                            // Last column received - transition to output
                            b_col_count <= 6'd0;
                        end else begin
                            b_col_count <= b_col_count + 1;
                            // Toggle bank every 2 columns
                            if (b_col_count[0]) begin
                                b_bank <= b_bank + 1;
                            end
                        end
                    end
                    
                    // Compute logic: process 8x8 blocks
                    if (operation_count < 64) begin
                        // Select current A rows (row_idx = 0,1,2,...,7)
                        // Rows are stored in banks, 2 per buffer
                        case (row_idx)
                            4'd0: begin
                                a_row_0_in <= a_buffer_0[63:0];      // Row 0
                                a_row_1_in <= a_buffer_0[127:64];    // Row 1
                                a_row_2_in <= a_buffer_1[63:0];      // Row 8
                                a_row_3_in <= a_buffer_1[127:64];    // Row 9
                            end
                            4'd1: begin
                                a_row_0_in <= a_buffer_0[191:128];   // Row 2
                                a_row_1_in <= a_buffer_0[255:192];   // Row 3
                                a_row_2_in <= a_buffer_1[191:128];   // Row 10
                                a_row_3_in <= a_buffer_1[255:192];   // Row 11
                            end
                            4'd2: begin
                                a_row_0_in <= a_buffer_0[319:256];   // Row 4
                                a_row_1_in <= a_buffer_0[383:320];   // Row 5
                                a_row_2_in <= a_buffer_1[319:256];   // Row 12
                                a_row_3_in <= a_buffer_1[383:320];   // Row 13
                            end
                            4'd3: begin
                                a_row_0_in <= a_buffer_0[447:384];   // Row 6
                                a_row_1_in <= a_buffer_0[511:448];   // Row 7
                                a_row_2_in <= a_buffer_1[447:384];   // Row 14
                                a_row_3_in <= a_buffer_1[511:448];   // Row 15
                            end
                            default: begin
                                a_row_0_in <= 64'd0;
                                a_row_1_in <= 64'd0;
                                a_row_2_in <= 64'd0;
                                a_row_3_in <= 64'd0;
                            end
                        endcase
                        
                        // Similarly for B columns
                        case (col_idx)
                            4'd0: begin
                                b_col_0_in <= b_buffer_0[63:0];
                                b_col_1_in <= b_buffer_0[127:64];
                                b_col_2_in <= b_buffer_1[63:0];
                                b_col_3_in <= b_buffer_1[127:64];
                            end
                            4'd1: begin
                                b_col_0_in <= b_buffer_0[191:128];
                                b_col_1_in <= b_buffer_0[255:192];
                                b_col_2_in <= b_buffer_1[191:128];
                                b_col_3_in <= b_buffer_1[255:192];
                            end
                            4'd2: begin
                                b_col_0_in <= b_buffer_0[319:256];
                                b_col_1_in <= b_buffer_0[383:320];
                                b_col_2_in <= b_buffer_1[319:256];
                                b_col_3_in <= b_buffer_1[383:320];
                            end
                            4'd3: begin
                                b_col_0_in <= b_buffer_0[447:384];
                                b_col_1_in <= b_buffer_0[511:448];
                                b_col_2_in <= b_buffer_1[447:384];
                                b_col_3_in <= b_buffer_1[511:448];
                            end
                            default: begin
                                b_col_0_in <= 64'd0;
                                b_col_1_in <= 64'd0;
                                b_col_2_in <= 64'd0;
                                b_col_3_in <= 64'd0;
                            end
                        endcase
                        
                        // Wait for all 16 slices to complete
                        if (&done_slice) begin
                            operation_count <= operation_count + 1;
                            
                            // Store 4 result rows (512-bit each = 2048 bits total)
                            c_buffer <= c_out_flat;
                            
                            // Increment indices for next 8x8 block
                            if (col_idx == 4'd7) begin
                                col_idx <= 4'd0;
                                if (row_idx == 4'd7) begin
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
                            2'd0: c_tdata <= c_buffer[511:0];
                            2'd1: c_tdata <= c_buffer[1023:512];
                            2'd2: c_tdata <= c_buffer[1535:1024];
                            2'd3: c_tdata <= c_buffer[2047:1536];
                            default: c_tdata <= 512'd0;
                        endcase
                        c_tvalid <= 1'b1;
                        
                        if (c_row_count == 6'd31) begin
                            state <= DONE;
                        end else begin
                            c_row_count <= c_row_count + 1;
                        end
                    end
                end
                
                SEND_C: begin
                    if (c_tready) begin
                        case (c_row_count[1:0])
                            2'd0: c_tdata <= c_buffer[511:0];
                            2'd1: c_tdata <= c_buffer[1023:512];
                            2'd2: c_tdata <= c_buffer[1535:1024];
                            2'd3: c_tdata <= c_buffer[2047:1536];
                            default: c_tdata <= 512'd0;
                        endcase
                        c_tvalid <= 1'b1;
                        
                        if (c_row_count == 6'd31) begin
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
    assign start_slice = {16{(state == STREAM && operation_count < 64)}};
    assign ap_done = (state == DONE);
    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);

endmodule