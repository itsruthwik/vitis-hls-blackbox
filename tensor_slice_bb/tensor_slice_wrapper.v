module tensor_slice_wrapper(
    input ap_clk,
    input ap_rst,
    input ap_ce,
    output ap_idle,
    input ap_start,
    output ap_ready,
    output ap_done,
    input ap_continue,

    input [63:0] a_data,
    input [63:0] b_data,

    output [127:0] c_data_out,
    output c_data_available_port
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
    //     .a_data_in(64'd0),
    //     .b_data_in(64'd0),
    //     .c_data_out(c_data_out),
    //     .a_data_out(),
    //     .b_data_out(),
    //     .flags_port(),
    //     .c_data_available_port(c_data_available_port),
    //     .validity_mask_a_rows(8'hFF),
    //     .validity_mask_a_cols_b_rows(8'hFF),
    //     .validity_mask_b_cols(8'hFF),
    //     .slice_dtype(2'b00),
    //     .slice_mode(1'b0),
    //     .op(3'b000),
    //     .preload(1'b0),
    //     .no_rounding(1'b0),
    //     .final_mat_mul_size(8'd8),
    //     .a_loc(5'd0),
    //     .b_loc(5'd0)
    // );

    // Control logic
    reg busy;
    always @(posedge ap_clk) begin
        if (ap_rst) begin
            busy <= 0;
        end else if (ap_ce) begin
            if (ap_start) begin
                busy <= 1;
            end else if (ap_done) begin
                busy <= 0;
            end
        end
    end

    assign ap_idle = !busy;
    assign ap_ready = !busy;


    always @(posedge ap_clk) begin
        if (ap_rst) begin
            c_data_out <= 128'd0;
            c_data_available_port <= 1'b0;
        end else if (ap_ce) begin
            if (ap_start) begin
                c_data_out <= {a_data, b_data};
                c_data_available_port <= 1'b1;
            end else begin
                c_data_available_port <= 1'b0;
            end
        end
    end

endmodule