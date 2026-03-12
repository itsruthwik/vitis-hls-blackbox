`timescale 1ns / 1ps

// ============================================================
// mlp_wrapper_lo — Bambu native port naming
// returns lower 64 bits of MLP output [63:0]
// ============================================================
module mlp_wrapper_lo (
    input  wire        clock,
    input  wire        reset,
    input  wire        start_port,
    input  wire [63:0] in_port_in_data,
    output reg         done_port,
    output reg  [63:0] return_port
);

    localparam S_WAIT_INIT = 2'd0;
    localparam S_IDLE      = 2'd1;
    localparam S_RUNNING   = 2'd2;
    localparam S_DONE      = 2'd3;

    reg [1:0] state;
    reg       start_latch;

    wire        mlp_ready;
    wire [127:0] mlp_out_data;
    wire        mlp_out_valid;
    reg         mlp_start;
    reg         mlp_out_ready;

    mlp_3layer mlp_inst (
        .clk       (clock),
        .rst       (~reset),
        .start     (mlp_start),
        .ready     (mlp_ready),
        .in_data   (in_port_in_data),
        .out_data  (mlp_out_data),
        .out_valid (mlp_out_valid),
        .out_ready (mlp_out_ready)
    );

    always @(posedge clock) begin
        if (~reset) begin
            state         <= S_WAIT_INIT;
            done_port     <= 1'b0;
            mlp_start     <= 1'b0;
            mlp_out_ready <= 1'b0;
            return_port   <= 64'd0;
	    start_latch   <= 1'b0;
        end else begin
            mlp_start     <= 1'b0;
            mlp_out_ready <= 1'b0;
            done_port     <= 1'b0;

            case (state)
                S_WAIT_INIT: begin
		    if (start_port) start_latch <= 1'b1;
                    if (mlp_ready)
                        state <= S_IDLE;
                end
                S_IDLE: begin
                    if (start_port || start_latch) begin
			start_latch <= 1'b0;
                        state     <= S_RUNNING;
                        mlp_start <= 1'b1;
                    end
                end
                S_RUNNING: begin
                    if (mlp_out_valid) begin
                        state         <= S_DONE;
                        return_port   <= mlp_out_data[63:0];
                        mlp_out_ready <= 1'b1;
                    end
                end
                S_DONE: begin
                    state     <= S_IDLE;
                    done_port <= 1'b1;
                end
            endcase
        end
    end

endmodule


// ============================================================
// mlp_wrapper_hi — Bambu native port naming
// returns upper 64 bits of MLP output [127:64]
// ============================================================
module mlp_wrapper_hi (
    input  wire        clock,
    input  wire        reset,
    input  wire        start_port,
    input  wire [63:0] in_port_in_data,
    output reg         done_port,
    output reg  [63:0] return_port
);

    localparam S_WAIT_INIT = 2'd0;
    localparam S_IDLE      = 2'd1;
    localparam S_RUNNING   = 2'd2;
    localparam S_DONE      = 2'd3;

    reg [1:0] state;
    reg       start_latch;

    wire        mlp_ready;
    wire [127:0] mlp_out_data;
    wire        mlp_out_valid;
    reg         mlp_start;
    reg         mlp_out_ready;

    mlp_3layer mlp_inst (
        .clk       (clock),
        .rst       (~reset),
        .start     (mlp_start),
        .ready     (mlp_ready),
        .in_data   (in_port_in_data),
        .out_data  (mlp_out_data),
        .out_valid (mlp_out_valid),
        .out_ready (mlp_out_ready)
    );

    always @(posedge clock) begin
        if (~reset) begin
            state         <= S_WAIT_INIT;
            done_port     <= 1'b0;
            mlp_start     <= 1'b0;
            mlp_out_ready <= 1'b0;
            return_port   <= 64'd0;
	    start_latch   <= 1'b0;
        end else begin
            mlp_start     <= 1'b0;
            mlp_out_ready <= 1'b0;
            done_port     <= 1'b0;

            case (state)
                S_WAIT_INIT: begin
		    if (start_port) start_latch <= 1'b1;
                    if (mlp_ready)
                        state <= S_IDLE;
                end
                S_IDLE: begin
                    if (start_port || start_latch) begin
			start_latch <= 1'b0;
                        state     <= S_RUNNING;
                        mlp_start <= 1'b1;
                    end
                end
                S_RUNNING: begin
                    if (mlp_out_valid) begin
                        state         <= S_DONE;
                        return_port   <= mlp_out_data[127:64];
                        mlp_out_ready <= 1'b1;
                    end
                end
                S_DONE: begin
                    state     <= S_IDLE;
                    done_port <= 1'b1;
                end
            endcase
        end
    end

endmodule
