(* black_box = "true" *)
module tensor_slice_int8(
    input clk,
    input reset,
    input pe_reset,
    input start_mat_mul,
    output reg done_mat_mul,
    input [63:0] a_data,      // One row of A (8 x 8-bit) - primary input
    input [63:0] b_data,      // One column of B (8 x 8-bit) - primary input
    input [63:0] a_data_in,   // Chain input from left (AIN)
    input [63:0] b_data_in,   // Chain input from top (BIN)
    output reg [127:0] c_data_out,  // One row of C (8 x 16-bit)
    output [63:0] a_data_out, // Chain output to right (AOUT)
    output [63:0] b_data_out, // Chain output to bottom (BOUT)
    output [7:0] flags,
    output reg c_data_available,
    output [35:0] extra_out,
    input [7:0] validity_mask_a_rows,
    input [7:0] validity_mask_a_cols_b_rows,
    input [7:0] validity_mask_b_cols,
    input [1:0] slice_dtype,
    input slice_mode,
    input [2:0] op,
    input preload,
    input no_rounding,
    input [7:0] final_mat_mul_size,
    input [4:0] a_loc,
    input [4:0] b_loc
);

    // Simplified behavioral model that mimics the timing and functionality
    // of the original systolic array without the complex PE implementation
    
    // Chaining support: A and B data propagate through array of tensor slices
    // A flows horizontally (left to right): a_data -> process -> a_data_out
    // B flows vertically (top to bottom): b_data -> process -> b_data_out
    
    reg [5:0] cycle_counter;  // 0 to 33
    reg operation_active;
    reg signed [7:0] a_row [0:7];  // Extracted row from a_data
    reg signed [7:0] b_col [0:7];  // Extracted column from b_data
    reg signed [15:0] c_row [0:7]; // Computed result row
    
    // Shift registers for chaining data through tensor slices
    // In systolic arrays, data takes multiple cycles to flow through
    // We delay the chain data to match the computation latency
    reg [63:0] a_chain_pipeline [0:32];  // 33-cycle pipeline for AIN -> AOUT
    reg [63:0] b_chain_pipeline [0:32];  // 33-cycle pipeline for BIN -> BOUT
    
    integer i, j, k, pipe_idx;
    
    // Chaining outputs: data delayed by 33 cycles to match computation latency
    assign a_data_out = a_chain_pipeline[32];
    assign b_data_out = b_chain_pipeline[32];
    assign flags = 8'd0;
    assign extra_out = 36'd0;
    
    always @(posedge clk) begin
        if (reset) begin
            cycle_counter <= 6'd0;
            operation_active <= 1'b0;
            done_mat_mul <= 1'b0;
            c_data_available <= 1'b0;
            c_data_out <= 128'd0;
            
            // Initialize chain pipelines
            for (pipe_idx = 0; pipe_idx < 33; pipe_idx = pipe_idx + 1) begin
                a_chain_pipeline[pipe_idx] <= 64'd0;
                b_chain_pipeline[pipe_idx] <= 64'd0;
            end
        end else begin
            // Update chaining pipelines (systolic data flow)
            // Shift data through 33-stage pipeline to match computation latency
            for (pipe_idx = 32; pipe_idx > 0; pipe_idx = pipe_idx - 1) begin
                a_chain_pipeline[pipe_idx] <= a_chain_pipeline[pipe_idx - 1];
                b_chain_pipeline[pipe_idx] <= b_chain_pipeline[pipe_idx - 1];
            end
            
            // First stage of pipeline gets input from chain
            a_chain_pipeline[0] <= a_data_in;
            b_chain_pipeline[0] <= b_data_in;
            
            // Start new operation
            if (start_mat_mul && !operation_active) begin
                operation_active <= 1'b1;
                cycle_counter <= 6'd1;
                
                // Extract input vectors from primary inputs (a_data, b_data)
                // In systolic arrays, chain data (a_data_in, b_data_in) propagates
                // while new data enters through a_data and b_data
                for (i = 0; i < 8; i = i + 1) begin
                    a_row[i] <= a_data[i*8 +: 8];
                    b_col[i] <= b_data[i*8 +: 8];
                end
                
                done_mat_mul <= 1'b0;
                c_data_available <= 1'b0;
            end
            // Process operation
            else if (operation_active) begin
                cycle_counter <= cycle_counter + 1'b1;
                
                // At cycle 33, complete computation and output result
                if (cycle_counter == 6'd33) begin
                    operation_active <= 1'b0;
                    done_mat_mul <= 1'b1;
                    c_data_available <= 1'b1;
                    
                    // Compute one row of C: c_row[i] = sum(a_row[k] * b_col[i]) for each i
                    // This mimics systolic array behavior where A row flows horizontally,
                    // B column flows vertically, producing C row
                    for (i = 0; i < 8; i = i + 1) begin
                        c_row[i] = 16'd0;
                        for (k = 0; k < 8; k = k + 1) begin
                            c_row[i] = c_row[i] + a_row[k] * b_col[i];
                        end
                    end
                    
                    // Pack result row into output
                    for (i = 0; i < 8; i = i + 1) begin
                        c_data_out[i*16 +: 16] <= c_row[i];
                    end
                end else begin
                    done_mat_mul <= 1'b0;
                    c_data_available <= 1'b0;
                end
            end
            // Reset done signal after one cycle
            else if (done_mat_mul) begin
                done_mat_mul <= 1'b0;
            end
        end
    end

endmodule
