`timescale 1ns/1ps

//=============================================================================
// mlp_3layer_tb — Testbench for 3-Layer MLP
//
// Network weights (hardcoded in mlp_3layer.v):
//   W1 = Identity    → Layer 1 output = input
//   W2 = Identity    → Layer 2 output = Layer 1 output (post-ReLU)
//   W3 = All-ones    → each Layer 3 output[j] = sum of Layer 2 outputs
//
// ── Test Cases ──────────────────────────────────────────────────────────
//
// TEST 1: x = [1,2,3,4,5,6,7,8]
//   L1 out  = [1,2,3,4,5,6,7,8]  (identity)
//   ReLU1   = [1,2,3,4,5,6,7,8]  (all positive, no clip)
//   L2 out  = [1,2,3,4,5,6,7,8]  (identity)
//   ReLU2   = [1,2,3,4,5,6,7,8]  (all positive, no clip)
//   L3 out  = [36,36,36,36,36,36,36,36] (1+2+…+8 = 36 for every col)
//   Expected: all columns = 36 = 0x0024
//
// TEST 2: x = [1,1,1,1,1,1,1,1]
//   L1 out  = [1,1,1,1,1,1,1,1]  (identity)
//   ReLU1   = [1,1,1,1,1,1,1,1]
//   L2 out  = [1,1,1,1,1,1,1,1]  (identity)
//   ReLU2   = [1,1,1,1,1,1,1,1]
//   L3 out  = [8,8,8,8,8,8,8,8]  (sum of eight 1s)
//   Expected: all columns = 8 = 0x0008
//
// TEST 3: x = [0,0,0,0,0,0,0,1]  (sparse: only x[0]=1)
//   L1 out  = [1,0,0,0,0,0,0,0]  (identity: only col0 fires)
//   ReLU1   = [1,0,0,0,0,0,0,0]
//   L2 out  = [1,0,0,0,0,0,0,0]  (identity)
//   ReLU2   = [1,0,0,0,0,0,0,0]
//   L3 out  = [1,1,1,1,1,1,1,1]  (all-ones: broadcast single input)
//   Expected: all columns = 1 = 0x0001
//=============================================================================
module mlp_3layer_tb;

    reg        clk, rst;
    reg        start;
    reg [63:0] in_data;
    wire       ready;
    wire [127:0] out_data;
    wire         out_valid;
    reg          out_ready;

    // Instantiate DUT
    mlp_3layer dut (
        .clk      (clk),
        .rst      (rst),
        .start    (start),
        .ready    (ready),
        .in_data  (in_data),
        .out_data (out_data),
        .out_valid(out_valid),
        .out_ready(out_ready)
    );

    // 100 MHz clock
    initial clk = 0;
    always  #5 clk = ~clk;

    integer j, errors, total_errors;
    reg signed [15:0] got, exp;
    integer cycle_count;

    //=========================================================================
    // Task: run_inference
    //   Feeds in_vec to the MLP and waits for out_valid.
    //   Compares all 8 output columns against expected.
    //=========================================================================
    task run_inference;
        input [63:0]  in_vec;
        input [127:0] expected;
        input integer test_num;
        begin
            // Wait until network is ready
            wait (ready === 1'b1);
            @(negedge clk);

            // Latch input and assert start for 1 cycle
            in_data   = in_vec;
            start     = 1'b1;
            cycle_count = 0;
            @(posedge clk);
            @(negedge clk);
            start     = 1'b0;

            // Wait for output (with timeout)
            fork
                begin
                    wait (out_valid === 1'b1);
                end
                begin
                    repeat(300) @(posedge clk);
                    $display("TEST %0d TIMEOUT — out_valid never asserted", test_num);
                    $finish;
                end
            join_any
            disable fork;

            // Evaluate results
            errors = 0;
            for (j = 0; j < 8; j = j + 1) begin
                got = $signed(out_data  [j*16 +: 16]);
                exp = $signed(expected  [j*16 +: 16]);
                if (got !== exp) begin
                    $display("  MISMATCH col[%0d]: got=%0d  expected=%0d", j, got, exp);
                    errors = errors + 1;
                end
            end

            if (errors == 0)
                $display("TEST %0d PASSED", test_num);
            else
                $display("TEST %0d FAILED  (%0d mismatches)", test_num, errors);

            total_errors = total_errors + errors;

            // Acknowledge result
            @(negedge clk);
            out_ready = 1'b1;
            repeat(2) @(posedge clk);
            @(negedge clk);
            out_ready = 1'b0;
            repeat(4) @(posedge clk);
        end
    endtask

    //=========================================================================
    // Main sequence
    //=========================================================================
    initial begin
        $dumpfile("mlp_3layer.vcd");
        $dumpvars(0, mlp_3layer_tb);

        rst       = 1'b1;
        start     = 1'b0;
        out_ready = 1'b0;
        in_data   = 64'd0;
        total_errors = 0;

        repeat(6) @(posedge clk);
        rst = 1'b0;

        // Wait for INIT to complete (24 weight-load cycles + margin)
        $display("Waiting for weight init...");
        repeat(30) @(posedge clk);
        $display("Weight init done. Running tests.\n");

        // ------------------------------------------------------------------
        // TEST 1: x = [1,2,3,4,5,6,7,8]  →  expected all cols = 36
        // ------------------------------------------------------------------
        $display("=== TEST 1: x=[1,2,3,4,5,6,7,8], expected all=36 ===");
        run_inference(
            64'h08_07_06_05_04_03_02_01,  // {x[7],...,x[0]}
            128'h0024_0024_0024_0024_0024_0024_0024_0024,
            1
        );

        // ------------------------------------------------------------------
        // TEST 2: x = [1,1,1,1,1,1,1,1]  →  expected all cols = 8
        // ------------------------------------------------------------------
        $display("=== TEST 2: x=[1,1,1,1,1,1,1,1], expected all=8 ===");
        run_inference(
            64'h01_01_01_01_01_01_01_01,
            128'h0008_0008_0008_0008_0008_0008_0008_0008,
            2
        );

        // ------------------------------------------------------------------
        // TEST 3: x = [1,0,0,0,0,0,0,0]  →  expected all cols = 1
        // (only x[0]=1, identity passes it through both hidden layers,
        //  all-ones L3 broadcasts it to all outputs)
        // ------------------------------------------------------------------
        $display("=== TEST 3: x=[1,0,...,0], expected all=1 ===");
        run_inference(
            64'h00_00_00_00_00_00_00_01,  // only x[0]=1
            128'h0001_0001_0001_0001_0001_0001_0001_0001,
            3
        );

        // ------------------------------------------------------------------
        // Summary
        // ------------------------------------------------------------------
        repeat(5) @(posedge clk);
        $display("\n======================================");
        if (total_errors == 0)
            $display("ALL TESTS PASSED  (0 errors)");
        else
            $display("FAILED — %0d total errors", total_errors);
        $display("======================================\n");

        $finish;
    end

endmodule

