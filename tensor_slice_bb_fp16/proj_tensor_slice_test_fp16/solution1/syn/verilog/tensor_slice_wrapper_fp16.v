`timescale 1ns / 1ps

module tensor_slice_wrapper_fp16(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    input [127:0] a_data,
    input [127:0] b_data,

    output reg [255:0] c_data_out,
    output reg c_data_available_port
);

    // Instantiate tensor_slice
    // tensor_slice ts (
    //     .clk(ap_clk),
    //     .reset(ap_rst),
    //     .pe_reset(1'b0),
    //     .start_mat_mul(ap_start),
    //     .done_mat_mul_port(ap_done),
    //     .a_data(a_data),
    //     .b_data(b_data),
    //     .a_data_in(128'd0),
    //     .b_data_in(128'd0),
    //     .c_data_out(c_data_out),
    //     .a_data_out(),
    //     .b_data_out(),
    //     .flags_port(),
    //     .c_data_available_port(c_data_available_port),
    //     .validity_mask_a_rows(8'hFF),
    //     .validity_mask_a_cols_b_rows(8'hFF),
    //     .validity_mask_b_cols(8'hFF),
    //     .slice_dtype(2'b10),
    //     .slice_mode(1'b0),
    //     .op(3'b000),
    //     .preload(1'b0),
    //     .no_rounding(1'b0),
    //     .final_mat_mul_size(8'd8),
    //     .a_loc(5'd0),
    //     .b_loc(5'd0)
    // );

	// Control logic - ap_ctrl_chain protocol
	reg [1:0] state;
	localparam IDLE = 2'd0;
	localparam BUSY = 2'd1;
	localparam DONE = 2'd2;

	always @(posedge ap_clk) begin
    		if (ap_rst) begin
        		state <= IDLE;
    		end else if (ap_ce) begin
        		case (state)
            			IDLE: begin
                		if (ap_start)
                    			state <= BUSY;
            			end
            			BUSY: begin
                		state <= DONE;  // One cycle computation
            			end
            			DONE: begin
                		if (ap_continue)
                    			state <= IDLE;
            			end
        		endcase
    		end
	end

	assign ap_idle = (state == IDLE);
	assign ap_ready = (state == IDLE);
	assign ap_done = (state == DONE);



	always @(posedge ap_clk) begin
		if (ap_rst) begin
			c_data_out <= 256'd0;
			c_data_available_port <= 1'b0;
		end else if (ap_ce) begin
			if (state == BUSY) begin
				// Dummy computation: concatenate inputs
				c_data_out <= {a_data, b_data};
				c_data_available_port <= 1'b1;
			end else if (state == DONE && ap_continue) begin
				c_data_available_port <= 1'b0;
			end
		end
	end

endmodule
