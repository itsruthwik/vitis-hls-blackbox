`timescale 1ns/1ps

//=============================================================================
// pe_ws — Weight-Stationary Processing Element (INT8 × INT8 → INT16)
//
//  Weight W[row][col] is preloaded once via w_load and stays fixed.
//
//  Data flows:
//    Activation  : left → right  (registered, 1-cycle pipeline delay)
//    Partial sum : top  → bottom (MAC: ps_out = ps_in + a_in × w_reg)
//
//  Both paths are guarded by valid signals. PE only computes when
//  a_in_v AND ps_in_v are both asserted simultaneously.
//
//  Note: 16-bit accumulator can overflow for large inputs. Safe for
//  INT8 × INT8 with up to ~256 accumulation steps at small values.
//=============================================================================
module pe_ws (
    input  wire        clk,
    input  wire        rst,
    // Weight preload (hold w_load high for 1 cycle)
    input  wire [7:0]  w_in,
    input  wire        w_load,
    // Activation data path: left → right
    input  wire [7:0]  a_in,
    input  wire        a_in_v,
    output reg  [7:0]  a_out,
    output reg         a_out_v,
    // Partial sum data path: top → bottom
    input  wire [15:0] ps_in,
    input  wire        ps_in_v,
    output reg  [15:0] ps_out,
    output reg         ps_out_v
);
    reg signed [7:0] w_reg;

    always @(posedge clk) begin
        if (rst) begin
            w_reg    <= 8'sd0;
            a_out    <= 8'd0;
            a_out_v  <= 1'b0;
            ps_out   <= 16'd0;
            ps_out_v <= 1'b0;
        end else begin
            // Latch weight when commanded
            if (w_load) w_reg <= $signed(w_in);

            // Pass activation rightward (1-cycle pipeline register)
            a_out   <= a_in;
            a_out_v <= a_in_v;

            // MAC: accumulate partial sum downward
            if (a_in_v && ps_in_v) begin
                ps_out   <= $signed(ps_in) + $signed(a_in) * w_reg;
                ps_out_v <= 1'b1;
            end else begin
                ps_out_v <= 1'b0;
                // ps_out holds its value when invalid (don't-care but stable)
            end
        end
    end
endmodule


//=============================================================================
// systolic_8x8_ws — 8×8 Weight-Stationary Systolic Array
//
// Computes: C[j] = Σᵢ x[i] · W[i][j]   for j = 0..7
//
// ── Architecture ─────────────────────────────────────────────────────────
//
//    col:  0      1      2     ...    7
//  row 0: PE─────PE─────PE─── ... ───PE   ← x[0] enters here at cycle 0
//          |      |      |              |
//  row 1: PE─────PE─────PE─── ... ───PE   ← x[1] enters here at cycle 1
//          |      |      |              |
//   ...                                     (natural skewing from serial input)
//          |      |      |              |
//  row 7: PE─────PE─────PE─── ... ───PE   ← x[7] enters here at cycle 7
//          ↓      ↓      ↓              ↓
//         C[0]  C[1]  C[2]   ...      C[7]
//
//  PE[i][j] fires at cycle i+j.  Column j output valid at cycle 8+j.
//  Total latency: 16 cycles from first a_valid to last column captured.
//
// ── Weight layout in w_data ──────────────────────────────────────────────
//  w_data[k*8 +: 8] = W[w_row][k]   (column k of the selected row)
//
// ── Activation stream ─────────────────────────────────────────────────────
//  Present x[0] on cycle 0 (a_valid high), x[1] next cycle, ..., x[7] last.
//  8 consecutive cycles complete one vector. Internal skewing auto-routes
//  x[i] → row i based on beat counter.
//
// ── Output ───────────────────────────────────────────────────────────────
//  c_data[j*16 +: 16] = C[j] (signed 16-bit, LSB-first column packing)
//  c_valid pulses for 1 cycle when all 8 results are latched.
//=============================================================================
module systolic_8x8_ws (
    input  wire        clk,
    input  wire        rst,

    // ── Weight preload ─────────────────────────────────────────────────────
    // Assert w_load for exactly 1 cycle per row. Can load during IDLE.
    input  wire [63:0] w_data,   // 8×INT8: W[w_row][7:0] packed LSB-first
    input  wire [2:0]  w_row,    // which row to load (0–7)
    input  wire        w_load,   // pulse for 1 cycle to latch row

    // ── Activation stream ──────────────────────────────────────────────────
    // One INT8 per cycle for 8 consecutive cycles: x[0] first, x[7] last.
    input  wire [7:0]  a_data,
    input  wire        a_valid,
    output wire        a_ready,  // high when array can accept activations

    // ── Result ─────────────────────────────────────────────────────────────
    output reg [127:0] c_data,   // 8×INT16 results, col j at bits [j*16+15:j*16]
    output reg         c_valid,  // pulses 1 cycle when all columns captured
    input  wire        c_ready   // downstream ready (de-assert to hold c_valid)
);

    //=========================================================================
    // FSM: IDLE → COMPUTE (8 beats) → DRAIN (wait for col outputs) → DONE
    //=========================================================================
    localparam IDLE    = 2'd0;
    localparam COMPUTE = 2'd1;
    localparam DRAIN   = 2'd2;
    localparam DONE    = 2'd3;

    reg [1:0] state;
    reg [3:0] beat;   // tracks which row we're feeding (0–7)

    // Accept activations while idle or computing
    assign a_ready = (state == IDLE) || (state == COMPUTE);

    always @(posedge clk) begin
        if (rst) begin
            state   <= IDLE;
            beat    <= 4'd0;
            c_valid <= 1'b0;
        end else begin
            case (state)
                // ── IDLE: wait for first activation ──────────────────────
                IDLE: begin
                    c_valid <= 1'b0;
                    if (a_valid && a_ready) begin
                        state <= COMPUTE;
                        beat  <= 4'd1;   // beat 0 consumed this cycle → advance
                    end else begin
                        beat <= 4'd0;    // hold beat at 0 while idle
                    end
                end

                // ── COMPUTE: stream 8 activations, one per cycle ──────────
                COMPUTE: begin
                    if (a_valid && a_ready) begin
                        if (beat == 4'd7) begin
                            state <= DRAIN;
                            beat  <= 4'd0;
                        end else begin
                            beat <= beat + 4'd1;
                        end
                    end
                end

                // ── DRAIN: wait for last column to emerge from array ──────
                // Column outputs arrive in order: col0 at cycle 8, col7 at 15.
                // cv_col[7] fires when column 7 (last) is ready.
                DRAIN: begin
                    if (cv_col[7]) begin
                        state   <= DONE;
                        c_valid <= 1'b1;
                    end
                end

                // ── DONE: hold c_valid until downstream acknowledges ──────
                DONE: begin
                    if (c_ready) begin
                        c_valid <= 1'b0;
                        state   <= IDLE;
                    end
                end
            endcase
        end
    end

    //=========================================================================
    // Activation input skewing
    // x[i] is routed to row i based on current beat value.
    // Beat naturally encodes the skew: serial input order = row order.
    //=========================================================================
    wire [7:0] a_row [0:7];    // left-side activation input per row
    wire       av_row[0:7];    // corresponding valid

    genvar gi;
    generate
        for (gi = 0; gi < 8; gi = gi + 1) begin : A_IN_MUX
            assign a_row[gi]  = (a_valid && a_ready && (beat == gi)) ? a_data : 8'd0;
            assign av_row[gi] = (a_valid && a_ready && (beat == gi));
        end
    endgenerate

    //=========================================================================
    // PE array: 8 rows × 8 columns
    // Wiring uses hierarchical references inside generate blocks.
    //
    // Per PE[row][col], local wires declared inside the generate scope:
    //   a_l / av_l  — left activation input  (from left neighbour or row input)
    //   ps_t / pv_t — top partial-sum input  (from PE above or zero for row 0)
    //   a_r / av_r  — right activation output → feeds PE[row][col+1].a_l
    //   ps_b / pv_b — bottom PS output       → feeds PE[row+1][col].ps_t
    //=========================================================================
    genvar row, col;

    generate
        for (row = 0; row < 8; row = row + 1) begin : ROW
            for (col = 0; col < 8; col = col + 1) begin : COL

                // ── Left activation input ─────────────────────────────────
                wire [7:0] a_l;
                wire       av_l;

                if (col == 0) begin : A_FROM_CTRL
                    // First column: activation comes from the skew controller
                    assign a_l  = a_row [row];
                    assign av_l = av_row[row];
                end else begin : A_FROM_LEFT
                    // Other columns: activation from left neighbour's output
                    assign a_l  = ROW[row].COL[col-1].a_r;
                    assign av_l = ROW[row].COL[col-1].av_r;
                end

                // ── Top partial-sum input ─────────────────────────────────
                wire [15:0] ps_t;
                wire        pv_t;

                if (row == 0) begin : PS_ZERO
                    // Top row: no prior accumulation; inject 0 (always valid
                    // so PE computes when activation arrives)
                    assign ps_t = 16'sd0;
                    assign pv_t = 1'b1;
                end else begin : PS_FROM_ABOVE
                    // Other rows: partial sum from the PE directly above
                    assign ps_t = ROW[row-1].COL[col].ps_b;
                    assign pv_t = ROW[row-1].COL[col].pv_b;
                end

                // ── PE instance ───────────────────────────────────────────
                wire [7:0]  a_r;    // activation output → rightward
                wire        av_r;
                wire [15:0] ps_b;   // partial sum output → downward
                wire        pv_b;

                pe_ws u_pe (
                    .clk     (clk),
                    .rst     (rst),
                    .w_in    (w_data[col*8 +: 8]),
                    .w_load  (w_load && (w_row == row)),
                    .a_in    (a_l),
                    .a_in_v  (av_l),
                    .a_out   (a_r),
                    .a_out_v (av_r),
                    .ps_in   (ps_t),
                    .ps_in_v (pv_t),
                    .ps_out  (ps_b),
                    .ps_out_v(pv_b)
                );
            end
        end
    endgenerate

    //=========================================================================
    // Output collection: tap the bottom row's partial-sum outputs.
    // Column j's result arrives valid at cycle 8+j (staggered).
    // We latch each column independently as its valid fires.
    // c_data is stable when all 8 have been captured (signalled by cv_col[7]).
    //=========================================================================
    wire [15:0] c_col [0:7];   // bottom-row PS output per column
    wire        cv_col[0:7];   // valid per column

    genvar gj;
    generate
        for (gj = 0; gj < 8; gj = gj + 1) begin : COL_TAP
            assign c_col[gj]  = ROW[7].COL[gj].ps_b;
            assign cv_col[gj] = ROW[7].COL[gj].pv_b;
        end
    endgenerate

    // Latch each column result as it arrives (independent of FSM state)
    always @(posedge clk) begin
        if (rst) begin
            c_data <= 128'd0;
        end else begin
            if (cv_col[0]) c_data[15:0]    <= c_col[0];
            if (cv_col[1]) c_data[31:16]   <= c_col[1];
            if (cv_col[2]) c_data[47:32]   <= c_col[2];
            if (cv_col[3]) c_data[63:48]   <= c_col[3];
            if (cv_col[4]) c_data[79:64]   <= c_col[4];
            if (cv_col[5]) c_data[95:80]   <= c_col[5];
            if (cv_col[6]) c_data[111:96]  <= c_col[6];
            if (cv_col[7]) c_data[127:112] <= c_col[7];
        end
    end

endmodule

