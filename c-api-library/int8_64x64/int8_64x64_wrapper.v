`timescale 1ns / 1ps

// 64x64 matrix multiplication wrapper using 2x2 tiling of 32x32 wrappers
// AXI Stream interface: 64 transfers of 512-bit rows/columns for inputs, 1024-bit rows for output
// Reuses int8_32x32_wrapper in a tiled configuration

module int8_64x64_wrapper(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    // AXI Stream input for matrix A (64 transfers of 512-bit rows)
    input [511:0] a_tdata,
    input a_tvalid,
    output a_tready,

    // AXI Stream input for matrix B (64 transfers of 512-bit columns)
    input [511:0] b_tdata,
    input b_tvalid,
    output b_tready,

    // AXI Stream output for matrix C (64 transfers of 1024-bit rows)
    output reg [1023:0] c_tdata,
    output reg c_tvalid,
    input c_tready
);

    // State machine
    localparam IDLE = 3'd0;
    localparam LOAD_A = 3'd1;
    localparam LOAD_B = 3'd2;
    localparam COMPUTE = 3'd3;
    localparam OUTPUT = 3'd4;
    localparam DONE_STATE = 3'd5;

    reg [2:0] state;
    reg [6:0] a_count, b_count, c_count;  // 0-63 counters
    reg [1:0] tile_i, tile_j, tile_k;     // Tile indices (0-1)
    
    // Buffers for A and B matrices (64x64 elements = 4096 elements each)
    // Store as 8-bit values for efficient access
    (* ram_style = "block" *) reg [7:0] a_buffer [0:4095];  // 64x64 int8
    (* ram_style = "block" *) reg [7:0] b_buffer [0:4095];  // 64x64 int8
    
    // Accumulator for C matrix (64x64 elements of 16-bit)
    (* ram_style = "block" *) reg [15:0] c_buffer [0:4095];  // 64x64 int16
    
    // Streams for 32x32 wrapper instances
    reg [255:0] tile_a_tdata;
    reg tile_a_tvalid;
    wire tile_a_tready;
    
    reg [255:0] tile_b_tdata;
    reg tile_b_tvalid;
    wire tile_b_tready;
    
    wire [511:0] tile_c_tdata;
    wire tile_c_tvalid;
    reg tile_c_tready;
    
    // 32x32 wrapper control signals
    reg tile_start;
    wire tile_done;
    wire tile_idle;
    wire tile_ready;
    reg tile_continue;
    
    // Instantiate one 32x32 wrapper (time-multiplexed for 8 operations)
    int8_32x32_wrapper tile_inst (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_ce(ap_ce),
        .ap_idle(tile_idle),
        .ap_start(tile_start),
        .ap_ready(tile_ready),
        .ap_done(tile_done),
        .ap_continue(tile_continue),
        .a_tdata(tile_a_tdata),
        .a_tvalid(tile_a_tvalid),
        .a_tready(tile_a_tready),
        .b_tdata(tile_b_tdata),
        .b_tvalid(tile_b_tvalid),
        .b_tready(tile_b_tready),
        .c_tdata(tile_c_tdata),
        .c_tvalid(tile_c_tvalid),
        .c_tready(tile_c_tready)
    );
    
    // Counters for feeding/receiving tile data
    reg [5:0] tile_a_row, tile_b_col, tile_c_row;  // 0-31 within tile
    
    // Top-level handshaking
    assign a_tready = (state == LOAD_A);
    assign b_tready = (state == LOAD_B);
    assign ap_done = (state == DONE_STATE);
    assign ap_idle = (state == IDLE);
    assign ap_ready = (state == IDLE);
    
    integer i;
    
    // Main state machine
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            state <= IDLE;
            a_count <= 7'd0;
            b_count <= 7'd0;
            c_count <= 7'd0;
            tile_i <= 2'd0;
            tile_j <= 2'd0;
            tile_k <= 2'd0;
            tile_start <= 1'b0;
            tile_continue <= 1'b0;
            tile_a_tvalid <= 1'b0;
            tile_b_tvalid <= 1'b0;
            tile_c_tready <= 1'b0;
            c_tvalid <= 1'b0;
            tile_a_row <= 6'd0;
            tile_b_col <= 6'd0;
            tile_c_row <= 6'd0;
            
            // Initialize C accumulator to zero
            for (i = 0; i < 4096; i = i + 1) begin
                c_buffer[i] <= 16'd0;
            end
        end else if (ap_ce) begin
            case (state)
                IDLE: begin
                    if (ap_start) begin
                        state <= LOAD_A;
                        a_count <= 7'd0;
                        b_count <= 7'd0;
                        c_count <= 7'd0;
                        tile_i <= 2'd0;
                        tile_j <= 2'd0;
                        tile_k <= 2'd0;
                        // Zero accumulator
                        for (i = 0; i < 4096; i = i + 1) begin
                            c_buffer[i] <= 16'd0;
                        end
                    end
                end
                
                LOAD_A: begin
                    // Load 64 rows of A (512-bit each = 64 int8 values)
                    if (a_tvalid) begin
                        // Unpack 512-bit into 64 bytes
                        for (i = 0; i < 64; i = i + 1) begin
                            a_buffer[a_count * 64 + i] <= a_tdata[i*8 +: 8];
                        end
                        
                        if (a_count == 7'd63) begin
                            state <= LOAD_B;
                            a_count <= 7'd0;
                        end else begin
                            a_count <= a_count + 1;
                        end
                    end
                end
                
                LOAD_B: begin
                    // Load 64 columns of B (512-bit each = 64 int8 values)
                    if (b_tvalid) begin
                        // Unpack 512-bit column into 64 bytes
                        for (i = 0; i < 64; i = i + 1) begin
                            b_buffer[i * 64 + b_count] <= b_tdata[i*8 +: 8];
                        end
                        
                        if (b_count == 7'd63) begin
                            state <= COMPUTE;
                            b_count <= 7'd0;
                            tile_start <= 1'b1;  // Start first tile computation
                            tile_a_row <= 6'd0;
                            tile_b_col <= 6'd0;
                            tile_c_row <= 6'd0;
                        end else begin
                            b_count <= b_count + 1;
                        end
                    end
                end
                
                COMPUTE: begin
                    tile_start <= 1'b0;
                    tile_continue <= 1'b0;
                    
                    // Feed A tile (32 rows of 256-bit)
                    if (tile_a_tready && tile_a_row < 32) begin
                        // Extract row from tile position
                        for (i = 0; i < 32; i = i + 1) begin
                            tile_a_tdata[i*8 +: 8] <= a_buffer[(tile_i*32 + tile_a_row)*64 + (tile_k*32 + i)];
                        end
                        tile_a_tvalid <= 1'b1;
                        tile_a_row <= tile_a_row + 1;
                    end else begin
                        tile_a_tvalid <= 1'b0;
                    end
                    
                    // Feed B tile (32 columns of 256-bit)
                    if (tile_b_tready && tile_b_col < 32) begin
                        // Extract column from tile position
                        for (i = 0; i < 32; i = i + 1) begin
                            tile_b_tdata[i*8 +: 8] <= b_buffer[(tile_k*32 + i)*64 + (tile_j*32 + tile_b_col)];
                        end
                        tile_b_tvalid <= 1'b1;
                        tile_b_col <= tile_b_col + 1;
                    end else begin
                        tile_b_tvalid <= 1'b0;
                    end
                    
                    // Receive C tile (32 rows of 512-bit)
                    if (tile_c_tvalid && tile_c_row < 32) begin
                        tile_c_tready <= 1'b1;
                        // Accumulate result into C buffer
                        for (i = 0; i < 32; i = i + 1) begin
                            c_buffer[(tile_i*32 + tile_c_row)*64 + (tile_j*32 + i)] <= 
                                c_buffer[(tile_i*32 + tile_c_row)*64 + (tile_j*32 + i)] + 
                                tile_c_tdata[i*16 +: 16];
                        end
                        tile_c_row <= tile_c_row + 1;
                    end else begin
                        tile_c_tready <= 1'b0;
                    end
                    
                    // Check if tile is done
                    if (tile_done) begin
                        tile_continue <= 1'b1;
                        
                        // Move to next tile
                        if (tile_k == 2'd1) begin
                            tile_k <= 2'd0;
                            if (tile_j == 2'd1) begin
                                tile_j <= 2'd0;
                                if (tile_i == 2'd1) begin
                                    // All tiles done
                                    state <= OUTPUT;
                                    c_count <= 7'd0;
                                end else begin
                                    tile_i <= tile_i + 1;
                                    tile_start <= 1'b1;
                                    tile_a_row <= 6'd0;
                                    tile_b_col <= 6'd0;
                                    tile_c_row <= 6'd0;
                                end
                            end else begin
                                tile_j <= tile_j + 1;
                                tile_start <= 1'b1;
                                tile_a_row <= 6'd0;
                                tile_b_col <= 6'd0;
                                tile_c_row <= 6'd0;
                            end
                        end else begin
                            tile_k <= tile_k + 1;
                            tile_start <= 1'b1;
                            tile_a_row <= 6'd0;
                            tile_b_col <= 6'd0;
                            tile_c_row <= 6'd0;
                        end
                    end
                end
                
                OUTPUT: begin
                    // Output 64 rows of C (1024-bit each = 64 int16 values)
                    if (c_tready || !c_tvalid) begin
                        for (i = 0; i < 64; i = i + 1) begin
                            c_tdata[i*16 +: 16] <= c_buffer[c_count * 64 + i];
                        end
                        c_tvalid <= 1'b1;
                        
                        if (c_count == 7'd63) begin
                            state <= DONE_STATE;
                        end else begin
                            c_count <= c_count + 1;
                        end
                    end
                end
                
                DONE_STATE: begin
                    c_tvalid <= 1'b0;
                    if (ap_continue) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule
