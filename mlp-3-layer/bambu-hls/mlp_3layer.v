`timescale 1ns/1ps

//=============================================================================
// mlp_3layer — 3-Layer Fully-Connected MLP  (8→8→8→8, INT8, Weight-Stationary)
//
// Architecture:
//   Input x[7:0] (INT8)
//     └─► Layer 1 : systolic_8x8_ws  (W1, 8×8)  → INT16
//           └─► ReLU + requant → INT8
//               └─► Layer 2 : systolic_8x8_ws  (W2, 8×8)  → INT16
//                     └─► ReLU + requant → INT8
//                         └─► Layer 3 : systolic_8x8_ws  (W3, 8×8)  → INT16
//                               └─► c_data output (raw INT16, no final requant)
//
// Weight storage:
//   Weights are hardcoded as localparams (ROM).
//   On reset, the FSM automatically preloads all 3 layers (24 w_load cycles)
//   before asserting ready.
//
//   W[layer][row][col] is packed as w_rom[layer][row][col*8 +: 8].
//   Byte ordering: w_data[col*8 +: 8] = W[row][col], col=0 at LSB.
//
// Interface:
//   start     — pulse 1 cycle to begin inference (ignored until ready=1)
//   in_data   — 8×INT8 input vector, packed {x[7],...,x[0]}, x[0] at LSB
//   out_data  — 8×INT16 result from Layer 3, packed same way
//   out_valid — pulses 1 cycle when out_data is stable
//   ready     — high when network has finished weight init and is idle
//
// Latency:
//   Each systolic layer takes ~16 cycles (8 feed + 8 drain).
//   Total inference ≈ 3 × 16 + 3 inter-layer handoffs ≈ 51 cycles.
//
// FSM states:
//   INIT  → preload weights for all 3 layers (24 cycles)
//   IDLE  → ready, waiting for start
//   FEED1 → stream in_data into Layer 1 (8 cycles)
//   WAIT1 → wait for Layer 1 c_valid
//   FEED2 → stream relu_requant(L1) into Layer 2 (8 cycles)
//   WAIT2 → wait for Layer 2 c_valid
//   FEED3 → stream relu_requant(L2) into Layer 3 (8 cycles)
//   WAIT3 → wait for Layer 3 c_valid
//   DONE  → hold out_valid until acknowledged (out_ready)
//=============================================================================
module mlp_3layer (
    input  wire        clk,
    input  wire        rst,

    // Control
    input  wire        start,      // begin inference
    output wire        ready,      // high when idle and weights loaded

    // Input vector: x[0..7], x[0] at bits [7:0]
    input  wire [63:0] in_data,    // 8 × INT8

    // Output vector: y[0..7], y[0] at bits [15:0]
    output reg [127:0] out_data,   // 8 × INT16
    output reg         out_valid,  // pulses 1 cycle
    input  wire        out_ready   // de-assert to stall in DONE
);

    //=========================================================================
    // Hardcoded Weight ROM
    //=========================================================================
    // Format: w_rom[layer][row] is a 64-bit word holding 8 INT8 weights.
    //         w_rom[layer][row][col*8 +: 8] = W_layer[row][col]
    //
    // Layer 1 — Identity matrix (output = input, easy baseline)
    //   W1[i][j] = 1 if i==j, else 0
    localparam [63:0] W1_R0 = 64'h00_00_00_00_00_00_00_01;
    localparam [63:0] W1_R1 = 64'h00_00_00_00_00_00_01_00;
    localparam [63:0] W1_R2 = 64'h00_00_00_00_00_01_00_00;
    localparam [63:0] W1_R3 = 64'h00_00_00_00_01_00_00_00;
    localparam [63:0] W1_R4 = 64'h00_00_00_01_00_00_00_00;
    localparam [63:0] W1_R5 = 64'h00_00_01_00_00_00_00_00;
    localparam [63:0] W1_R6 = 64'h00_01_00_00_00_00_00_00;
    localparam [63:0] W1_R7 = 64'h01_00_00_00_00_00_00_00;

    // Layer 2 — Identity matrix
    localparam [63:0] W2_R0 = 64'h00_00_00_00_00_00_00_01;
    localparam [63:0] W2_R1 = 64'h00_00_00_00_00_00_01_00;
    localparam [63:0] W2_R2 = 64'h00_00_00_00_00_01_00_00;
    localparam [63:0] W2_R3 = 64'h00_00_00_00_01_00_00_00;
    localparam [63:0] W2_R4 = 64'h00_00_00_01_00_00_00_00;
    localparam [63:0] W2_R5 = 64'h00_00_01_00_00_00_00_00;
    localparam [63:0] W2_R6 = 64'h00_01_00_00_00_00_00_00;
    localparam [63:0] W2_R7 = 64'h01_00_00_00_00_00_00_00;

    // Layer 3 — All-ones matrix (each output = sum of all inputs)
    localparam [63:0] W3_R0 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R1 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R2 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R3 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R4 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R5 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R6 = 64'h01_01_01_01_01_01_01_01;
    localparam [63:0] W3_R7 = 64'h01_01_01_01_01_01_01_01;

    //=========================================================================
    // FSM
    //=========================================================================
    localparam INIT  = 4'd0;
    localparam IDLE  = 4'd1;
    localparam FEED1 = 4'd2;
    localparam WAIT1 = 4'd3;
    localparam FEED2 = 4'd4;
    localparam WAIT2 = 4'd5;
    localparam FEED3 = 4'd6;
    localparam WAIT3 = 4'd7;
    localparam DONE  = 4'd8;

    reg [3:0] state;
    reg [4:0] init_cnt;   // 0..23 (8 rows × 3 layers)
    reg [3:0] beat;       // 0..7 for feed phases

    assign ready = (state == IDLE);

    //=========================================================================
    // Systolic array instances
    //=========================================================================
    // Shared weight-load bus (only one layer active at a time during INIT)
    reg [63:0] w_data_bus;
    reg [2:0]  w_row_bus;
    reg        w_load_l1, w_load_l2, w_load_l3;

    // Layer 1
    reg  [7:0]  l1_a_data;
    reg         l1_a_valid;
    wire        l1_a_ready;
    wire [127:0] l1_c_data;
    wire         l1_c_valid;
    reg          l1_c_ready;

    systolic_8x8_ws layer1 (
        .clk    (clk),
        .rst    (rst),
        .w_data (w_data_bus),
        .w_row  (w_row_bus),
        .w_load (w_load_l1),
        .a_data (l1_a_data),
        .a_valid(l1_a_valid),
        .a_ready(l1_a_ready),
        .c_data (l1_c_data),
        .c_valid(l1_c_valid),
        .c_ready(l1_c_ready)
    );

    // Layer 2
    reg  [7:0]  l2_a_data;
    reg         l2_a_valid;
    wire        l2_a_ready;
    wire [127:0] l2_c_data;
    wire         l2_c_valid;
    reg          l2_c_ready;

    systolic_8x8_ws layer2 (
        .clk    (clk),
        .rst    (rst),
        .w_data (w_data_bus),
        .w_row  (w_row_bus),
        .w_load (w_load_l2),
        .a_data (l2_a_data),
        .a_valid(l2_a_valid),
        .a_ready(l2_a_ready),
        .c_data (l2_c_data),
        .c_valid(l2_c_valid),
        .c_ready(l2_c_ready)
    );

    // Layer 3
    reg  [7:0]  l3_a_data;
    reg         l3_a_valid;
    wire        l3_a_ready;
    wire [127:0] l3_c_data;
    wire         l3_c_valid;
    reg          l3_c_ready;

    systolic_8x8_ws layer3 (
        .clk    (clk),
        .rst    (rst),
        .w_data (w_data_bus),
        .w_row  (w_row_bus),
        .w_load (w_load_l3),
        .a_data (l3_a_data),
        .a_valid(l3_a_valid),
        .a_ready(l3_a_ready),
        .c_data (l3_c_data),
        .c_valid(l3_c_valid),
        .c_ready(l3_c_ready)
    );

    //=========================================================================
    // ReLU + Requantize between layers
    //=========================================================================
    wire [63:0] relu1_out;    // L1 → L2 activations (INT8)
    wire [63:0] relu2_out;    // L2 → L3 activations (INT8)

    relu_requant relu1 (.in_data(l1_c_data), .out_data(relu1_out));
    relu_requant relu2 (.in_data(l2_c_data), .out_data(relu2_out));

    // Inter-layer activation buffers (latched when c_valid fires)
    reg [63:0] act_buf1;  // latched relu1_out
    reg [63:0] act_buf2;  // latched relu2_out

    //=========================================================================
    // Weight ROM mux — combinational select based on init_cnt
    //=========================================================================
    always @(*) begin
        w_load_l1 = 1'b0;
        w_load_l2 = 1'b0;
        w_load_l3 = 1'b0;
        w_row_bus  = init_cnt[2:0];
        w_data_bus = 64'd0;

        if (state == INIT) begin
            if (init_cnt < 5'd8) begin
                // Loading Layer 1 (rows 0..7)
                w_load_l1 = 1'b1;
                case (init_cnt[2:0])
                    3'd0: w_data_bus = W1_R0;
                    3'd1: w_data_bus = W1_R1;
                    3'd2: w_data_bus = W1_R2;
                    3'd3: w_data_bus = W1_R3;
                    3'd4: w_data_bus = W1_R4;
                    3'd5: w_data_bus = W1_R5;
                    3'd6: w_data_bus = W1_R6;
                    3'd7: w_data_bus = W1_R7;
                    default: w_data_bus = 64'd0;
                endcase
            end else if (init_cnt < 5'd16) begin
                // Loading Layer 2 (rows 0..7)
                w_load_l2 = 1'b1;
                case (init_cnt[2:0])
                    3'd0: w_data_bus = W2_R0;
                    3'd1: w_data_bus = W2_R1;
                    3'd2: w_data_bus = W2_R2;
                    3'd3: w_data_bus = W2_R3;
                    3'd4: w_data_bus = W2_R4;
                    3'd5: w_data_bus = W2_R5;
                    3'd6: w_data_bus = W2_R6;
                    3'd7: w_data_bus = W2_R7;
                    default: w_data_bus = 64'd0;
                endcase
            end else begin
                // Loading Layer 3 (rows 0..7)
                w_load_l3 = 1'b1;
                case (init_cnt[2:0])
                    3'd0: w_data_bus = W3_R0;
                    3'd1: w_data_bus = W3_R1;
                    3'd2: w_data_bus = W3_R2;
                    3'd3: w_data_bus = W3_R3;
                    3'd4: w_data_bus = W3_R4;
                    3'd5: w_data_bus = W3_R5;
                    3'd6: w_data_bus = W3_R6;
                    3'd7: w_data_bus = W3_R7;
                    default: w_data_bus = 64'd0;
                endcase
            end
        end
    end

    //=========================================================================
    // Main FSM + datapath
    //=========================================================================
    always @(posedge clk) begin
        if (rst) begin
            state      <= INIT;
            init_cnt   <= 5'd0;
            beat       <= 4'd0;
            out_valid  <= 1'b0;
            out_data   <= 128'd0;
            act_buf1   <= 64'd0;
            act_buf2   <= 64'd0;
            // Clear layer inputs
            l1_a_data  <= 8'd0; l1_a_valid <= 1'b0; l1_c_ready <= 1'b1;
            l2_a_data  <= 8'd0; l2_a_valid <= 1'b0; l2_c_ready <= 1'b1;
            l3_a_data  <= 8'd0; l3_a_valid <= 1'b0; l3_c_ready <= 1'b1;
        end else begin
            // Default: deassert pulses each cycle
            l1_a_valid <= 1'b0;
            l2_a_valid <= 1'b0;
            l3_a_valid <= 1'b0;
            out_valid  <= 1'b0;

            case (state)
                //--------------------------------------------------------------
                // INIT: clock in weight rows sequentially across all 3 layers
                //--------------------------------------------------------------
                INIT: begin
                    if (init_cnt == 5'd23) begin
                        state    <= IDLE;
                        init_cnt <= 5'd0;
                    end else begin
                        init_cnt <= init_cnt + 5'd1;
                    end
                end

                //--------------------------------------------------------------
                // IDLE: wait for start pulse
                //--------------------------------------------------------------
                IDLE: begin
                    beat <= 4'd0;
                    if (start) state <= FEED1;
                end

                //--------------------------------------------------------------
                // FEED1: stream in_data[beat] → Layer 1
                //--------------------------------------------------------------
                FEED1: begin
                    if (l1_a_ready) begin
                        l1_a_data  <= in_data[beat*8 +: 8];
                        l1_a_valid <= 1'b1;
                        if (beat == 4'd7) begin
                            beat  <= 4'd0;
                            state <= WAIT1;
                        end else begin
                            beat <= beat + 4'd1;
                        end
                    end
                end

                //--------------------------------------------------------------
                // WAIT1: wait for Layer 1 result, latch relu'd activations
                //--------------------------------------------------------------
                WAIT1: begin
                    if (l1_c_valid) begin
                        act_buf1 <= relu1_out;  // combinational from l1_c_data
                        state    <= FEED2;
                    end
                end

                //--------------------------------------------------------------
                // FEED2: stream act_buf1[beat] → Layer 2
                //--------------------------------------------------------------
                FEED2: begin
                    if (l2_a_ready) begin
                        l2_a_data  <= act_buf1[beat*8 +: 8];
                        l2_a_valid <= 1'b1;
                        if (beat == 4'd7) begin
                            beat  <= 4'd0;
                            state <= WAIT2;
                        end else begin
                            beat <= beat + 4'd1;
                        end
                    end
                end

                //--------------------------------------------------------------
                // WAIT2: wait for Layer 2 result
                //--------------------------------------------------------------
                WAIT2: begin
                    if (l2_c_valid) begin
                        act_buf2 <= relu2_out;
                        state    <= FEED3;
                    end
                end

                //--------------------------------------------------------------
                // FEED3: stream act_buf2[beat] → Layer 3
                //--------------------------------------------------------------
                FEED3: begin
                    if (l3_a_ready) begin
                        l3_a_data  <= act_buf2[beat*8 +: 8];
                        l3_a_valid <= 1'b1;
                        if (beat == 4'd7) begin
                            beat  <= 4'd0;
                            state <= WAIT3;
                        end else begin
                            beat <= beat + 4'd1;
                        end
                    end
                end

                //--------------------------------------------------------------
                // WAIT3: wait for Layer 3 final result
                //--------------------------------------------------------------
                WAIT3: begin
                    if (l3_c_valid) begin
                        out_data  <= l3_c_data;
                        out_valid <= 1'b1;
                        state     <= DONE;
                    end
                end

                //--------------------------------------------------------------
                // DONE: hold until downstream acknowledges
                //--------------------------------------------------------------
                DONE: begin
                    out_valid <= 1'b1;  // keep high until out_ready
                    if (out_ready) begin
                        out_valid <= 1'b0;
                        state     <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule

