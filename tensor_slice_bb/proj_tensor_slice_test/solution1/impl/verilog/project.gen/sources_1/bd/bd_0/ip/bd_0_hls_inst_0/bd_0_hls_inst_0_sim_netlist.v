// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Fri Jan 30 10:01:22 2026
// Host        : en4234856l running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /mnt/vault0/jchoudh3/custom-blackbox/vitis-hls-blackbox/tensor_slice_bb/proj_tensor_slice_test/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.v
// Design      : bd_0_hls_inst_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu9p-flga2104-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,tensor_slice_test,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "tensor_slice_test,Vivado 2024.1" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module bd_0_hls_inst_0
   (ap_clk,
    ap_rst,
    ap_done,
    ap_idle,
    ap_ready,
    ap_start,
    ap_return,
    a_data,
    b_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 ap_return DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_return, LAYERED_METADATA undef" *) output [127:0]ap_return;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_data DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_data, LAYERED_METADATA undef" *) input [63:0]a_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_data DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_data, LAYERED_METADATA undef" *) input [63:0]b_data;

  wire [63:0]a_data;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire [127:0]ap_return;
  wire ap_rst;
  wire ap_start;
  wire [63:0]b_data;

  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "4'b0001" *) 
  (* ap_ST_fsm_state2 = "4'b0010" *) 
  (* ap_ST_fsm_state3 = "4'b0100" *) 
  (* ap_ST_fsm_state4 = "4'b1000" *) 
  bd_0_hls_inst_0_tensor_slice_test inst
       (.a_data(a_data),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_return(ap_return),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .b_data(b_data));
endmodule

(* ORIG_REF_NAME = "tensor_slice_test" *) (* ap_ST_fsm_state1 = "4'b0001" *) (* ap_ST_fsm_state2 = "4'b0010" *) 
(* ap_ST_fsm_state3 = "4'b0100" *) (* ap_ST_fsm_state4 = "4'b1000" *) (* hls_module = "yes" *) 
module bd_0_hls_inst_0_tensor_slice_test
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    a_data,
    b_data,
    ap_return);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [63:0]a_data;
  input [63:0]b_data;
  output [127:0]ap_return;

  wire [63:0]a_data;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire [3:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_idle;
  wire ap_ready;
  wire [127:0]ap_return;
  wire ap_rst;
  wire ap_start;
  wire [63:0]b_data;
  wire [127:0]c_data_out;
  wire c_data_out_fu_280;

  assign ap_done = ap_ready;
  LUT3 #(
    .INIT(8'hBA)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_ready),
        .I1(ap_start),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .O(ap_NS_fsm[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_CS_fsm_state2),
        .I1(ap_ready),
        .I2(ap_start),
        .I3(\ap_CS_fsm_reg_n_0_[0] ),
        .I4(ap_CS_fsm_state3),
        .O(ap_NS_fsm[1]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_state3),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[3]),
        .Q(ap_ready),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_0_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  FDRE \c_data_out_fu_28_reg[0] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[0]),
        .Q(ap_return[0]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[100] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[100]),
        .Q(ap_return[100]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[101] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[101]),
        .Q(ap_return[101]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[102] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[102]),
        .Q(ap_return[102]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[103] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[103]),
        .Q(ap_return[103]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[104] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[104]),
        .Q(ap_return[104]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[105] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[105]),
        .Q(ap_return[105]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[106] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[106]),
        .Q(ap_return[106]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[107] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[107]),
        .Q(ap_return[107]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[108] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[108]),
        .Q(ap_return[108]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[109] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[109]),
        .Q(ap_return[109]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[10] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[10]),
        .Q(ap_return[10]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[110] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[110]),
        .Q(ap_return[110]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[111] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[111]),
        .Q(ap_return[111]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[112] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[112]),
        .Q(ap_return[112]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[113] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[113]),
        .Q(ap_return[113]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[114] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[114]),
        .Q(ap_return[114]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[115] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[115]),
        .Q(ap_return[115]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[116] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[116]),
        .Q(ap_return[116]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[117] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[117]),
        .Q(ap_return[117]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[118] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[118]),
        .Q(ap_return[118]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[119] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[119]),
        .Q(ap_return[119]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[11] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[11]),
        .Q(ap_return[11]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[120] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[120]),
        .Q(ap_return[120]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[121] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[121]),
        .Q(ap_return[121]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[122] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[122]),
        .Q(ap_return[122]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[123] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[123]),
        .Q(ap_return[123]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[124] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[124]),
        .Q(ap_return[124]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[125] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[125]),
        .Q(ap_return[125]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[126] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[126]),
        .Q(ap_return[126]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[127] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[127]),
        .Q(ap_return[127]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[12] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[12]),
        .Q(ap_return[12]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[13] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[13]),
        .Q(ap_return[13]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[14] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[14]),
        .Q(ap_return[14]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[15] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[15]),
        .Q(ap_return[15]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[16] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[16]),
        .Q(ap_return[16]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[17] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[17]),
        .Q(ap_return[17]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[18] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[18]),
        .Q(ap_return[18]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[19] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[19]),
        .Q(ap_return[19]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[1] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[1]),
        .Q(ap_return[1]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[20] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[20]),
        .Q(ap_return[20]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[21] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[21]),
        .Q(ap_return[21]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[22] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[22]),
        .Q(ap_return[22]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[23] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[23]),
        .Q(ap_return[23]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[24] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[24]),
        .Q(ap_return[24]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[25] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[25]),
        .Q(ap_return[25]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[26] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[26]),
        .Q(ap_return[26]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[27] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[27]),
        .Q(ap_return[27]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[28] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[28]),
        .Q(ap_return[28]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[29] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[29]),
        .Q(ap_return[29]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[2] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[2]),
        .Q(ap_return[2]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[30] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[30]),
        .Q(ap_return[30]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[31] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[31]),
        .Q(ap_return[31]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[32] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[32]),
        .Q(ap_return[32]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[33] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[33]),
        .Q(ap_return[33]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[34] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[34]),
        .Q(ap_return[34]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[35] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[35]),
        .Q(ap_return[35]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[36] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[36]),
        .Q(ap_return[36]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[37] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[37]),
        .Q(ap_return[37]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[38] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[38]),
        .Q(ap_return[38]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[39] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[39]),
        .Q(ap_return[39]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[3] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[3]),
        .Q(ap_return[3]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[40] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[40]),
        .Q(ap_return[40]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[41] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[41]),
        .Q(ap_return[41]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[42] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[42]),
        .Q(ap_return[42]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[43] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[43]),
        .Q(ap_return[43]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[44] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[44]),
        .Q(ap_return[44]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[45] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[45]),
        .Q(ap_return[45]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[46] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[46]),
        .Q(ap_return[46]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[47] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[47]),
        .Q(ap_return[47]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[48] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[48]),
        .Q(ap_return[48]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[49] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[49]),
        .Q(ap_return[49]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[4] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[4]),
        .Q(ap_return[4]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[50] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[50]),
        .Q(ap_return[50]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[51] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[51]),
        .Q(ap_return[51]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[52] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[52]),
        .Q(ap_return[52]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[53] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[53]),
        .Q(ap_return[53]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[54] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[54]),
        .Q(ap_return[54]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[55] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[55]),
        .Q(ap_return[55]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[56] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[56]),
        .Q(ap_return[56]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[57] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[57]),
        .Q(ap_return[57]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[58] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[58]),
        .Q(ap_return[58]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[59] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[59]),
        .Q(ap_return[59]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[5] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[5]),
        .Q(ap_return[5]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[60] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[60]),
        .Q(ap_return[60]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[61] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[61]),
        .Q(ap_return[61]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[62] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[62]),
        .Q(ap_return[62]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[63] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[63]),
        .Q(ap_return[63]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[64] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[64]),
        .Q(ap_return[64]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[65] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[65]),
        .Q(ap_return[65]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[66] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[66]),
        .Q(ap_return[66]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[67] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[67]),
        .Q(ap_return[67]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[68] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[68]),
        .Q(ap_return[68]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[69] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[69]),
        .Q(ap_return[69]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[6] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[6]),
        .Q(ap_return[6]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[70] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[70]),
        .Q(ap_return[70]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[71] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[71]),
        .Q(ap_return[71]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[72] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[72]),
        .Q(ap_return[72]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[73] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[73]),
        .Q(ap_return[73]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[74] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[74]),
        .Q(ap_return[74]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[75] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[75]),
        .Q(ap_return[75]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[76] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[76]),
        .Q(ap_return[76]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[77] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[77]),
        .Q(ap_return[77]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[78] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[78]),
        .Q(ap_return[78]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[79] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[79]),
        .Q(ap_return[79]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[7] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[7]),
        .Q(ap_return[7]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[80] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[80]),
        .Q(ap_return[80]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[81] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[81]),
        .Q(ap_return[81]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[82] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[82]),
        .Q(ap_return[82]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[83] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[83]),
        .Q(ap_return[83]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[84] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[84]),
        .Q(ap_return[84]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[85] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[85]),
        .Q(ap_return[85]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[86] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[86]),
        .Q(ap_return[86]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[87] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[87]),
        .Q(ap_return[87]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[88] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[88]),
        .Q(ap_return[88]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[89] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[89]),
        .Q(ap_return[89]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[8] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[8]),
        .Q(ap_return[8]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[90] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[90]),
        .Q(ap_return[90]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[91] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[91]),
        .Q(ap_return[91]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[92] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[92]),
        .Q(ap_return[92]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[93] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[93]),
        .Q(ap_return[93]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[94] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[94]),
        .Q(ap_return[94]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[95] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[95]),
        .Q(ap_return[95]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[96] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[96]),
        .Q(ap_return[96]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[97] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[97]),
        .Q(ap_return[97]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[98] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[98]),
        .Q(ap_return[98]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[99] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[99]),
        .Q(ap_return[99]),
        .R(1'b0));
  FDRE \c_data_out_fu_28_reg[9] 
       (.C(ap_clk),
        .CE(c_data_out_fu_280),
        .D(c_data_out[9]),
        .Q(ap_return[9]),
        .R(1'b0));
  bd_0_hls_inst_0_tensor_slice_wrapper grp_tensor_slice_wrapper_fu_44
       (.D(c_data_out),
        .E(c_data_out_fu_280),
        .\FSM_onehot_state_reg[0]_0 (ap_NS_fsm[3:2]),
        .Q({ap_CS_fsm_state3,ap_CS_fsm_state2,\ap_CS_fsm_reg_n_0_[0] }),
        .a_data(a_data),
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .b_data(b_data));
endmodule

(* ORIG_REF_NAME = "tensor_slice_wrapper" *) 
module bd_0_hls_inst_0_tensor_slice_wrapper
   (D,
    \FSM_onehot_state_reg[0]_0 ,
    E,
    ap_clk,
    ap_rst,
    b_data,
    a_data,
    Q,
    ap_start);
  output [127:0]D;
  output [1:0]\FSM_onehot_state_reg[0]_0 ;
  output [0:0]E;
  input ap_clk;
  input ap_rst;
  input [63:0]b_data;
  input [63:0]a_data;
  input [2:0]Q;
  input ap_start;

  wire [127:0]D;
  wire [0:0]E;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire [1:0]\FSM_onehot_state_reg[0]_0 ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire [2:0]Q;
  wire [63:0]a_data;
  wire ap_clk;
  wire ap_rst;
  wire ap_start;
  wire [63:0]b_data;
  wire c_data_available_port_i_1_n_0;
  wire c_data_out0_i_1_n_0;
  wire grp_tensor_slice_wrapper_fu_44_ap_done;
  wire grp_tensor_slice_wrapper_fu_44_ap_start;
  wire grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld;
  wire NLW_c_data_out0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__0_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__0_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__0_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__0_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__0_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__1_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__1_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__1_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__1_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__1_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__1_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__2_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__2_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__2_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__2_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__2_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__2_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__3_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__3_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__3_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__3_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__3_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__3_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__3_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__3_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__3_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__3_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__3_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__3_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__4_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__4_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__4_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__4_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__4_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__4_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__4_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__4_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__4_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__4_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__4_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__4_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__5_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__5_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__5_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__5_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__5_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__5_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__5_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__5_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__5_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__5_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__5_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__5_XOROUT_UNCONNECTED;
  wire NLW_c_data_out0__6_CARRYCASCOUT_UNCONNECTED;
  wire NLW_c_data_out0__6_MULTSIGNOUT_UNCONNECTED;
  wire NLW_c_data_out0__6_OVERFLOW_UNCONNECTED;
  wire NLW_c_data_out0__6_PATTERNBDETECT_UNCONNECTED;
  wire NLW_c_data_out0__6_PATTERNDETECT_UNCONNECTED;
  wire NLW_c_data_out0__6_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_c_data_out0__6_ACOUT_UNCONNECTED;
  wire [17:0]NLW_c_data_out0__6_BCOUT_UNCONNECTED;
  wire [3:0]NLW_c_data_out0__6_CARRYOUT_UNCONNECTED;
  wire [47:16]NLW_c_data_out0__6_P_UNCONNECTED;
  wire [47:0]NLW_c_data_out0__6_PCOUT_UNCONNECTED;
  wire [7:0]NLW_c_data_out0__6_XOROUT_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFEFEFEFEFEFEF000)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(grp_tensor_slice_wrapper_fu_44_ap_start),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(grp_tensor_slice_wrapper_fu_44_ap_done),
        .I5(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(ap_start),
        .I1(Q[0]),
        .O(grp_tensor_slice_wrapper_fu_44_ap_start));
  (* FSM_ENCODED_STATES = "IDLE:010,BUSY:100,DONE:001," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(ap_clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[2] ),
        .Q(grp_tensor_slice_wrapper_fu_44_ap_done),
        .R(ap_rst));
  (* FSM_ENCODED_STATES = "IDLE:010,BUSY:100,DONE:001," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(ap_clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(grp_tensor_slice_wrapper_fu_44_ap_done),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .S(ap_rst));
  (* FSM_ENCODED_STATES = "IDLE:010,BUSY:100,DONE:001," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(ap_clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(grp_tensor_slice_wrapper_fu_44_ap_done),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(\FSM_onehot_state_reg[0]_0 [0]));
  LUT2 #(
    .INIT(4'h8)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(grp_tensor_slice_wrapper_fu_44_ap_done),
        .I1(Q[2]),
        .O(\FSM_onehot_state_reg[0]_0 [1]));
  LUT6 #(
    .INIT(64'hFFFF01FFFEFE0000)) 
    c_data_available_port_i_1
       (.I0(grp_tensor_slice_wrapper_fu_44_ap_start),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(grp_tensor_slice_wrapper_fu_44_ap_done),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld),
        .O(c_data_available_port_i_1_n_0));
  FDRE c_data_available_port_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(c_data_available_port_i_1_n_0),
        .Q(grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld),
        .R(ap_rst));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[7:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[7:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0_P_UNCONNECTED[47:16],D[15:0]}),
        .PATTERNBDETECT(NLW_c_data_out0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[15:8]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[15:8]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__0_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__0_P_UNCONNECTED[47:16],D[31:16]}),
        .PATTERNBDETECT(NLW_c_data_out0__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__0_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[23:16]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[23:16]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__1_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__1_P_UNCONNECTED[47:16],D[47:32]}),
        .PATTERNBDETECT(NLW_c_data_out0__1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__1_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__1_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__2
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[31:24]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[31:24]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__2_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__2_P_UNCONNECTED[47:16],D[63:48]}),
        .PATTERNBDETECT(NLW_c_data_out0__2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__2_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__2_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__3
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[39:32]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__3_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[39:32]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__3_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__3_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__3_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__3_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__3_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__3_P_UNCONNECTED[47:16],D[79:64]}),
        .PATTERNBDETECT(NLW_c_data_out0__3_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__3_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__3_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__3_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__3_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__4
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[47:40]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__4_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[47:40]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__4_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__4_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__4_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__4_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__4_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__4_P_UNCONNECTED[47:16],D[95:80]}),
        .PATTERNBDETECT(NLW_c_data_out0__4_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__4_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__4_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__4_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__4_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__5
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[55:48]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__5_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[55:48]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__5_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__5_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__5_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__5_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__5_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__5_P_UNCONNECTED[47:16],D[111:96]}),
        .PATTERNBDETECT(NLW_c_data_out0__5_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__5_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__5_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__5_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__5_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    c_data_out0__6
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_data[63:56]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_c_data_out0__6_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,b_data[63:56]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_c_data_out0__6_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_c_data_out0__6_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_c_data_out0__6_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(c_data_out0_i_1_n_0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_c_data_out0__6_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_c_data_out0__6_OVERFLOW_UNCONNECTED),
        .P({NLW_c_data_out0__6_P_UNCONNECTED[47:16],D[127:112]}),
        .PATTERNBDETECT(NLW_c_data_out0__6_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_c_data_out0__6_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_c_data_out0__6_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(ap_rst),
        .UNDERFLOW(NLW_c_data_out0__6_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_c_data_out0__6_XOROUT_UNCONNECTED[7:0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFF80000)) 
    c_data_out0_i_1
       (.I0(Q[0]),
        .I1(ap_start),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .O(c_data_out0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hCCC8)) 
    \c_data_out_fu_28[127]_i_1 
       (.I0(Q[2]),
        .I1(grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(E));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
