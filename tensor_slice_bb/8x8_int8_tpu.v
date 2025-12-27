

`define BB_DWIDTH 8
`define BB_AWIDTH 10
`define BB_MAT_MUL_SIZE 8
`define BB_MASK_WIDTH 8
`define BB_LOG2_MAT_MUL_SIZE 3
`define NUM_CYCLES_IN_MAC 3
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ADDR_STRIDE_WIDTH 16

`define DTYPE_INT8  2'b00
//`define DTYPE_INT16 2'b01
`define DTYPE_FP16  2'b10
//`define DTYPE_BF16  2'b11

`define SLICE_MODE_TENSOR 0
// `define SLICE_MODE_INDIV_PE 1
// `define ELTWISE_MUL 2'b01
// `define ELTWISE_ADD 2'b10
// `define ELTWISE_SUB 2'b11

`define PE_BREAKOUT 8
`define TOTAL_PES 16

//`define SIMULATION

 module tensor_slice(
 clk,
 reset,
 pe_reset, //this can also be called accumulate
 start_mat_mul,
 done_mat_mul_port,
 a_data,
 b_data,
 a_data_in, //Input matrix A values coming in from previous matmul - systolic connections
 b_data_in, //Input matrix B values coming in from previous matmul - systolic connections 
 c_data_out, //Output values going out to any place that needs it like BRAM or next matmul
 a_data_out, //Input matrix A values going out to next matmul - systolic shifting
 b_data_out, //Input matrix A values going out to next matmul - systolic shifting
 flags_port,
 c_data_available_port,
 validity_mask_a_rows,
 validity_mask_a_cols_b_rows,
 validity_mask_b_cols,
 slice_dtype,  //which data type/precision 
 slice_mode,   //which mode : 0 is tensor mode, 1 is individual PEs
 op,           //decides an op (add,mult,mac) based on the mode
 preload,
 final_mat_mul_size,
 a_loc,
 b_loc,
 no_rounding/*,
 extra_out*/
);

 input clk;
 input reset;
 input pe_reset;
 input start_mat_mul;
 output reg done_mat_mul_port;
 input [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] a_data;
 input [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] b_data;
 input [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] a_data_in;
 input [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] b_data_in;
 output reg [2*`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] c_data_out;
 output reg [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] a_data_out;
 output reg [`BB_MAT_MUL_SIZE*`BB_DWIDTH-1:0] b_data_out;
 output reg [3:0] flags_port;
 output reg c_data_available_port;
 input [`BB_MASK_WIDTH-1:0] validity_mask_a_rows;
 input [`BB_MASK_WIDTH-1:0] validity_mask_a_cols_b_rows;
 input [`BB_MASK_WIDTH-1:0] validity_mask_b_cols;
 input [1:0] slice_dtype;
 input slice_mode;
 input [2:0] op;
 input preload;
 input no_rounding;
// output [35:0] extra_out; //Adding 36 outputs. This allows us to expose 1 extra PE and also helps in mat-vec mul mode and eltwise modes.
                          //Do note that the 4 MSBs are for output flags in the second output logic
 input [7:0] final_mat_mul_size; //7:0 is okay here. We aren't going to make a matmul larger than 256x256
 input [4:0] a_loc;
 input [4:0] b_loc;
 

reg [31:0] dummy_reg;

// Dummy sequential logic
always @(posedge clk) begin
    if (reset) begin
        dummy_reg <= 0;
        done_mat_mul_port <= 0;
        c_data_out <= 0;
        a_data_out <= 0;
        b_data_out <= 0;
        flags_port <= 0;
        c_data_available_port <= 0;
    end else begin
        dummy_reg <= dummy_reg + validity_mask_a_rows + validity_mask_a_cols_b_rows + validity_mask_b_cols + 
                     slice_dtype + slice_mode + op + preload + no_rounding + final_mat_mul_size + a_loc + b_loc + pe_reset;
        a_data_out <= a_data_in;
        b_data_out <= b_data_in;
        c_data_out <= {a_data, b_data};
        done_mat_mul_port <= start_mat_mul;
        flags_port <= dummy_reg[3:0];
        c_data_available_port <= preload;
    end
end

endmodule