-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Fri Jan 30 10:01:22 2026
-- Host        : en4234856l running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /mnt/vault0/jchoudh3/custom-blackbox/vitis-hls-blackbox/tensor_slice_bb/proj_tensor_slice_test/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu9p-flga2104-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_tensor_slice_wrapper is
  port (
    D : out STD_LOGIC_VECTOR ( 127 downto 0 );
    \FSM_onehot_state_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    b_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    a_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ap_start : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_tensor_slice_wrapper : entity is "tensor_slice_wrapper";
end bd_0_hls_inst_0_tensor_slice_wrapper;

architecture STRUCTURE of bd_0_hls_inst_0_tensor_slice_wrapper is
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal c_data_available_port_i_1_n_0 : STD_LOGIC;
  signal c_data_out0_i_1_n_0 : STD_LOGIC;
  signal grp_tensor_slice_wrapper_fu_44_ap_done : STD_LOGIC;
  signal grp_tensor_slice_wrapper_fu_44_ap_start : STD_LOGIC;
  signal grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld : STD_LOGIC;
  signal NLW_c_data_out0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_c_data_out0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_c_data_out0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_c_data_out0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_c_data_out0_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal NLW_c_data_out0_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_c_data_out0_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__0_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__0_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__1_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__1_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__1_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__1_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__1_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__1_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__1_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__2_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__2_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__2_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__2_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__2_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__2_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__2_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__3_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__3_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__3_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__3_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__3_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__3_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__3_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__4_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__4_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__4_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__4_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__4_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__4_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__4_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__5_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__5_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__5_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__5_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__5_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__5_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__5_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_c_data_out0__6_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_c_data_out0__6_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_c_data_out0__6_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_c_data_out0__6_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_c_data_out0__6_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 16 );
  signal \NLW_c_data_out0__6_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_c_data_out0__6_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_2\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "IDLE:010,BUSY:100,DONE:001,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "IDLE:010,BUSY:100,DONE:001,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "IDLE:010,BUSY:100,DONE:001,";
  attribute SOFT_HLUTNM of \ap_CS_fsm[2]_i_1\ : label is "soft_lutpair1";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of c_data_out0 : label is "yes";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of c_data_out0 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__0\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__0\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__1\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__1\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__2\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__2\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__3\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__3\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__4\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__4\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__5\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__5\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of \c_data_out0__6\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \c_data_out0__6\ : label is "{SYNTH-12 {cell *THIS*}}";
  attribute SOFT_HLUTNM of c_data_out0_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \c_data_out_fu_28[127]_i_1\ : label is "soft_lutpair1";
begin
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEF000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => grp_tensor_slice_wrapper_fu_44_ap_start,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => grp_tensor_slice_wrapper_fu_44_ap_done,
      I5 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_start,
      I1 => Q(0),
      O => grp_tensor_slice_wrapper_fu_44_ap_start
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      D => \FSM_onehot_state_reg_n_0_[2]\,
      Q => grp_tensor_slice_wrapper_fu_44_ap_done,
      R => ap_rst
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      D => grp_tensor_slice_wrapper_fu_44_ap_done,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      S => ap_rst
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      D => \FSM_onehot_state_reg_n_0_[1]\,
      Q => \FSM_onehot_state_reg_n_0_[2]\,
      R => ap_rst
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => grp_tensor_slice_wrapper_fu_44_ap_done,
      I1 => Q(2),
      I2 => Q(1),
      O => \FSM_onehot_state_reg[0]_0\(0)
    );
\ap_CS_fsm[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => grp_tensor_slice_wrapper_fu_44_ap_done,
      I1 => Q(2),
      O => \FSM_onehot_state_reg[0]_0\(1)
    );
c_data_available_port_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF01FFFEFE0000"
    )
        port map (
      I0 => grp_tensor_slice_wrapper_fu_44_ap_start,
      I1 => Q(1),
      I2 => Q(2),
      I3 => grp_tensor_slice_wrapper_fu_44_ap_done,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      I5 => grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld,
      O => c_data_available_port_i_1_n_0
    );
c_data_available_port_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => c_data_available_port_i_1_n_0,
      Q => grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld,
      R => ap_rst
    );
c_data_out0: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(7 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_c_data_out0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(7 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_c_data_out0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_c_data_out0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_c_data_out0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_c_data_out0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_c_data_out0_OVERFLOW_UNCONNECTED,
      P(47 downto 16) => NLW_c_data_out0_P_UNCONNECTED(47 downto 16),
      P(15 downto 0) => D(15 downto 0),
      PATTERNBDETECT => NLW_c_data_out0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_c_data_out0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_c_data_out0_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => NLW_c_data_out0_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_c_data_out0_XOROUT_UNCONNECTED(7 downto 0)
    );
\c_data_out0__0\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(15 downto 8),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(15 downto 8),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__0_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__0_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(31 downto 16),
      PATTERNBDETECT => \NLW_c_data_out0__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__0_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__1\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(23 downto 16),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__1_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(23 downto 16),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__1_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__1_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__1_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__1_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__1_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__1_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(47 downto 32),
      PATTERNBDETECT => \NLW_c_data_out0__1_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__1_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__1_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__1_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__1_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__2\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(31 downto 24),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__2_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(31 downto 24),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__2_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__2_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__2_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__2_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__2_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__2_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(63 downto 48),
      PATTERNBDETECT => \NLW_c_data_out0__2_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__2_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__2_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__2_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__2_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__3\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(39 downto 32),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__3_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(39 downto 32),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__3_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__3_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__3_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__3_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__3_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__3_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(79 downto 64),
      PATTERNBDETECT => \NLW_c_data_out0__3_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__3_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__3_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__3_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__3_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__4\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(47 downto 40),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__4_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(47 downto 40),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__4_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__4_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__4_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__4_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__4_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__4_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(95 downto 80),
      PATTERNBDETECT => \NLW_c_data_out0__4_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__4_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__4_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__4_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__4_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__5\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(55 downto 48),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__5_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(55 downto 48),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__5_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__5_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__5_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__5_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__5_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__5_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(111 downto 96),
      PATTERNBDETECT => \NLW_c_data_out0__5_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__5_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__5_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__5_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__5_XOROUT_UNCONNECTED\(7 downto 0)
    );
\c_data_out0__6\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 8) => B"0000000000000000000000",
      A(7 downto 0) => a_data(63 downto 56),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_c_data_out0__6_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 8) => B"0000000000",
      B(7 downto 0) => b_data(63 downto 56),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_c_data_out0__6_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_c_data_out0__6_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_c_data_out0__6_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => c_data_out0_i_1_n_0,
      CLK => ap_clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_c_data_out0__6_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_c_data_out0__6_OVERFLOW_UNCONNECTED\,
      P(47 downto 16) => \NLW_c_data_out0__6_P_UNCONNECTED\(47 downto 16),
      P(15 downto 0) => D(127 downto 112),
      PATTERNBDETECT => \NLW_c_data_out0__6_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_c_data_out0__6_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_c_data_out0__6_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => ap_rst,
      UNDERFLOW => \NLW_c_data_out0__6_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_c_data_out0__6_XOROUT_UNCONNECTED\(7 downto 0)
    );
c_data_out0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF80000"
    )
        port map (
      I0 => Q(0),
      I1 => ap_start,
      I2 => Q(1),
      I3 => Q(2),
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      O => c_data_out0_i_1_n_0
    );
\c_data_out_fu_28[127]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC8"
    )
        port map (
      I0 => Q(2),
      I1 => grp_tensor_slice_wrapper_fu_44_c_data_out_ap_vld,
      I2 => Q(1),
      I3 => Q(0),
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_tensor_slice_test is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    a_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    b_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_return : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_tensor_slice_test : entity is "tensor_slice_test";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of bd_0_hls_inst_0_tensor_slice_test : entity is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of bd_0_hls_inst_0_tensor_slice_test : entity is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of bd_0_hls_inst_0_tensor_slice_test : entity is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of bd_0_hls_inst_0_tensor_slice_test : entity is "4'b1000";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0_tensor_slice_test : entity is "yes";
end bd_0_hls_inst_0_tensor_slice_test;

architecture STRUCTURE of bd_0_hls_inst_0_tensor_slice_test is
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^ap_ready\ : STD_LOGIC;
  signal c_data_out : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal c_data_out_fu_280 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair2";
begin
  ap_done <= \^ap_ready\;
  ap_ready <= \^ap_ready\;
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^ap_ready\,
      I1 => ap_start,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => \^ap_ready\,
      I2 => ap_start,
      I3 => \ap_CS_fsm_reg_n_0_[0]\,
      I4 => ap_CS_fsm_state3,
      O => ap_NS_fsm(1)
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => ap_rst
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => ap_CS_fsm_state3,
      R => ap_rst
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(3),
      Q => \^ap_ready\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_0_[0]\,
      I1 => ap_start,
      O => ap_idle
    );
\c_data_out_fu_28_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(0),
      Q => ap_return(0),
      R => '0'
    );
\c_data_out_fu_28_reg[100]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(100),
      Q => ap_return(100),
      R => '0'
    );
\c_data_out_fu_28_reg[101]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(101),
      Q => ap_return(101),
      R => '0'
    );
\c_data_out_fu_28_reg[102]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(102),
      Q => ap_return(102),
      R => '0'
    );
\c_data_out_fu_28_reg[103]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(103),
      Q => ap_return(103),
      R => '0'
    );
\c_data_out_fu_28_reg[104]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(104),
      Q => ap_return(104),
      R => '0'
    );
\c_data_out_fu_28_reg[105]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(105),
      Q => ap_return(105),
      R => '0'
    );
\c_data_out_fu_28_reg[106]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(106),
      Q => ap_return(106),
      R => '0'
    );
\c_data_out_fu_28_reg[107]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(107),
      Q => ap_return(107),
      R => '0'
    );
\c_data_out_fu_28_reg[108]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(108),
      Q => ap_return(108),
      R => '0'
    );
\c_data_out_fu_28_reg[109]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(109),
      Q => ap_return(109),
      R => '0'
    );
\c_data_out_fu_28_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(10),
      Q => ap_return(10),
      R => '0'
    );
\c_data_out_fu_28_reg[110]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(110),
      Q => ap_return(110),
      R => '0'
    );
\c_data_out_fu_28_reg[111]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(111),
      Q => ap_return(111),
      R => '0'
    );
\c_data_out_fu_28_reg[112]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(112),
      Q => ap_return(112),
      R => '0'
    );
\c_data_out_fu_28_reg[113]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(113),
      Q => ap_return(113),
      R => '0'
    );
\c_data_out_fu_28_reg[114]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(114),
      Q => ap_return(114),
      R => '0'
    );
\c_data_out_fu_28_reg[115]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(115),
      Q => ap_return(115),
      R => '0'
    );
\c_data_out_fu_28_reg[116]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(116),
      Q => ap_return(116),
      R => '0'
    );
\c_data_out_fu_28_reg[117]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(117),
      Q => ap_return(117),
      R => '0'
    );
\c_data_out_fu_28_reg[118]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(118),
      Q => ap_return(118),
      R => '0'
    );
\c_data_out_fu_28_reg[119]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(119),
      Q => ap_return(119),
      R => '0'
    );
\c_data_out_fu_28_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(11),
      Q => ap_return(11),
      R => '0'
    );
\c_data_out_fu_28_reg[120]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(120),
      Q => ap_return(120),
      R => '0'
    );
\c_data_out_fu_28_reg[121]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(121),
      Q => ap_return(121),
      R => '0'
    );
\c_data_out_fu_28_reg[122]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(122),
      Q => ap_return(122),
      R => '0'
    );
\c_data_out_fu_28_reg[123]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(123),
      Q => ap_return(123),
      R => '0'
    );
\c_data_out_fu_28_reg[124]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(124),
      Q => ap_return(124),
      R => '0'
    );
\c_data_out_fu_28_reg[125]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(125),
      Q => ap_return(125),
      R => '0'
    );
\c_data_out_fu_28_reg[126]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(126),
      Q => ap_return(126),
      R => '0'
    );
\c_data_out_fu_28_reg[127]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(127),
      Q => ap_return(127),
      R => '0'
    );
\c_data_out_fu_28_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(12),
      Q => ap_return(12),
      R => '0'
    );
\c_data_out_fu_28_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(13),
      Q => ap_return(13),
      R => '0'
    );
\c_data_out_fu_28_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(14),
      Q => ap_return(14),
      R => '0'
    );
\c_data_out_fu_28_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(15),
      Q => ap_return(15),
      R => '0'
    );
\c_data_out_fu_28_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(16),
      Q => ap_return(16),
      R => '0'
    );
\c_data_out_fu_28_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(17),
      Q => ap_return(17),
      R => '0'
    );
\c_data_out_fu_28_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(18),
      Q => ap_return(18),
      R => '0'
    );
\c_data_out_fu_28_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(19),
      Q => ap_return(19),
      R => '0'
    );
\c_data_out_fu_28_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(1),
      Q => ap_return(1),
      R => '0'
    );
\c_data_out_fu_28_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(20),
      Q => ap_return(20),
      R => '0'
    );
\c_data_out_fu_28_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(21),
      Q => ap_return(21),
      R => '0'
    );
\c_data_out_fu_28_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(22),
      Q => ap_return(22),
      R => '0'
    );
\c_data_out_fu_28_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(23),
      Q => ap_return(23),
      R => '0'
    );
\c_data_out_fu_28_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(24),
      Q => ap_return(24),
      R => '0'
    );
\c_data_out_fu_28_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(25),
      Q => ap_return(25),
      R => '0'
    );
\c_data_out_fu_28_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(26),
      Q => ap_return(26),
      R => '0'
    );
\c_data_out_fu_28_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(27),
      Q => ap_return(27),
      R => '0'
    );
\c_data_out_fu_28_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(28),
      Q => ap_return(28),
      R => '0'
    );
\c_data_out_fu_28_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(29),
      Q => ap_return(29),
      R => '0'
    );
\c_data_out_fu_28_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(2),
      Q => ap_return(2),
      R => '0'
    );
\c_data_out_fu_28_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(30),
      Q => ap_return(30),
      R => '0'
    );
\c_data_out_fu_28_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(31),
      Q => ap_return(31),
      R => '0'
    );
\c_data_out_fu_28_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(32),
      Q => ap_return(32),
      R => '0'
    );
\c_data_out_fu_28_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(33),
      Q => ap_return(33),
      R => '0'
    );
\c_data_out_fu_28_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(34),
      Q => ap_return(34),
      R => '0'
    );
\c_data_out_fu_28_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(35),
      Q => ap_return(35),
      R => '0'
    );
\c_data_out_fu_28_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(36),
      Q => ap_return(36),
      R => '0'
    );
\c_data_out_fu_28_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(37),
      Q => ap_return(37),
      R => '0'
    );
\c_data_out_fu_28_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(38),
      Q => ap_return(38),
      R => '0'
    );
\c_data_out_fu_28_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(39),
      Q => ap_return(39),
      R => '0'
    );
\c_data_out_fu_28_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(3),
      Q => ap_return(3),
      R => '0'
    );
\c_data_out_fu_28_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(40),
      Q => ap_return(40),
      R => '0'
    );
\c_data_out_fu_28_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(41),
      Q => ap_return(41),
      R => '0'
    );
\c_data_out_fu_28_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(42),
      Q => ap_return(42),
      R => '0'
    );
\c_data_out_fu_28_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(43),
      Q => ap_return(43),
      R => '0'
    );
\c_data_out_fu_28_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(44),
      Q => ap_return(44),
      R => '0'
    );
\c_data_out_fu_28_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(45),
      Q => ap_return(45),
      R => '0'
    );
\c_data_out_fu_28_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(46),
      Q => ap_return(46),
      R => '0'
    );
\c_data_out_fu_28_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(47),
      Q => ap_return(47),
      R => '0'
    );
\c_data_out_fu_28_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(48),
      Q => ap_return(48),
      R => '0'
    );
\c_data_out_fu_28_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(49),
      Q => ap_return(49),
      R => '0'
    );
\c_data_out_fu_28_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(4),
      Q => ap_return(4),
      R => '0'
    );
\c_data_out_fu_28_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(50),
      Q => ap_return(50),
      R => '0'
    );
\c_data_out_fu_28_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(51),
      Q => ap_return(51),
      R => '0'
    );
\c_data_out_fu_28_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(52),
      Q => ap_return(52),
      R => '0'
    );
\c_data_out_fu_28_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(53),
      Q => ap_return(53),
      R => '0'
    );
\c_data_out_fu_28_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(54),
      Q => ap_return(54),
      R => '0'
    );
\c_data_out_fu_28_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(55),
      Q => ap_return(55),
      R => '0'
    );
\c_data_out_fu_28_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(56),
      Q => ap_return(56),
      R => '0'
    );
\c_data_out_fu_28_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(57),
      Q => ap_return(57),
      R => '0'
    );
\c_data_out_fu_28_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(58),
      Q => ap_return(58),
      R => '0'
    );
\c_data_out_fu_28_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(59),
      Q => ap_return(59),
      R => '0'
    );
\c_data_out_fu_28_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(5),
      Q => ap_return(5),
      R => '0'
    );
\c_data_out_fu_28_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(60),
      Q => ap_return(60),
      R => '0'
    );
\c_data_out_fu_28_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(61),
      Q => ap_return(61),
      R => '0'
    );
\c_data_out_fu_28_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(62),
      Q => ap_return(62),
      R => '0'
    );
\c_data_out_fu_28_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(63),
      Q => ap_return(63),
      R => '0'
    );
\c_data_out_fu_28_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(64),
      Q => ap_return(64),
      R => '0'
    );
\c_data_out_fu_28_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(65),
      Q => ap_return(65),
      R => '0'
    );
\c_data_out_fu_28_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(66),
      Q => ap_return(66),
      R => '0'
    );
\c_data_out_fu_28_reg[67]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(67),
      Q => ap_return(67),
      R => '0'
    );
\c_data_out_fu_28_reg[68]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(68),
      Q => ap_return(68),
      R => '0'
    );
\c_data_out_fu_28_reg[69]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(69),
      Q => ap_return(69),
      R => '0'
    );
\c_data_out_fu_28_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(6),
      Q => ap_return(6),
      R => '0'
    );
\c_data_out_fu_28_reg[70]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(70),
      Q => ap_return(70),
      R => '0'
    );
\c_data_out_fu_28_reg[71]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(71),
      Q => ap_return(71),
      R => '0'
    );
\c_data_out_fu_28_reg[72]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(72),
      Q => ap_return(72),
      R => '0'
    );
\c_data_out_fu_28_reg[73]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(73),
      Q => ap_return(73),
      R => '0'
    );
\c_data_out_fu_28_reg[74]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(74),
      Q => ap_return(74),
      R => '0'
    );
\c_data_out_fu_28_reg[75]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(75),
      Q => ap_return(75),
      R => '0'
    );
\c_data_out_fu_28_reg[76]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(76),
      Q => ap_return(76),
      R => '0'
    );
\c_data_out_fu_28_reg[77]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(77),
      Q => ap_return(77),
      R => '0'
    );
\c_data_out_fu_28_reg[78]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(78),
      Q => ap_return(78),
      R => '0'
    );
\c_data_out_fu_28_reg[79]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(79),
      Q => ap_return(79),
      R => '0'
    );
\c_data_out_fu_28_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(7),
      Q => ap_return(7),
      R => '0'
    );
\c_data_out_fu_28_reg[80]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(80),
      Q => ap_return(80),
      R => '0'
    );
\c_data_out_fu_28_reg[81]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(81),
      Q => ap_return(81),
      R => '0'
    );
\c_data_out_fu_28_reg[82]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(82),
      Q => ap_return(82),
      R => '0'
    );
\c_data_out_fu_28_reg[83]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(83),
      Q => ap_return(83),
      R => '0'
    );
\c_data_out_fu_28_reg[84]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(84),
      Q => ap_return(84),
      R => '0'
    );
\c_data_out_fu_28_reg[85]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(85),
      Q => ap_return(85),
      R => '0'
    );
\c_data_out_fu_28_reg[86]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(86),
      Q => ap_return(86),
      R => '0'
    );
\c_data_out_fu_28_reg[87]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(87),
      Q => ap_return(87),
      R => '0'
    );
\c_data_out_fu_28_reg[88]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(88),
      Q => ap_return(88),
      R => '0'
    );
\c_data_out_fu_28_reg[89]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(89),
      Q => ap_return(89),
      R => '0'
    );
\c_data_out_fu_28_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(8),
      Q => ap_return(8),
      R => '0'
    );
\c_data_out_fu_28_reg[90]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(90),
      Q => ap_return(90),
      R => '0'
    );
\c_data_out_fu_28_reg[91]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(91),
      Q => ap_return(91),
      R => '0'
    );
\c_data_out_fu_28_reg[92]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(92),
      Q => ap_return(92),
      R => '0'
    );
\c_data_out_fu_28_reg[93]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(93),
      Q => ap_return(93),
      R => '0'
    );
\c_data_out_fu_28_reg[94]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(94),
      Q => ap_return(94),
      R => '0'
    );
\c_data_out_fu_28_reg[95]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(95),
      Q => ap_return(95),
      R => '0'
    );
\c_data_out_fu_28_reg[96]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(96),
      Q => ap_return(96),
      R => '0'
    );
\c_data_out_fu_28_reg[97]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(97),
      Q => ap_return(97),
      R => '0'
    );
\c_data_out_fu_28_reg[98]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(98),
      Q => ap_return(98),
      R => '0'
    );
\c_data_out_fu_28_reg[99]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(99),
      Q => ap_return(99),
      R => '0'
    );
\c_data_out_fu_28_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => c_data_out_fu_280,
      D => c_data_out(9),
      Q => ap_return(9),
      R => '0'
    );
grp_tensor_slice_wrapper_fu_44: entity work.bd_0_hls_inst_0_tensor_slice_wrapper
     port map (
      D(127 downto 0) => c_data_out(127 downto 0),
      E(0) => c_data_out_fu_280,
      \FSM_onehot_state_reg[0]_0\(1 downto 0) => ap_NS_fsm(3 downto 2),
      Q(2) => ap_CS_fsm_state3,
      Q(1) => ap_CS_fsm_state2,
      Q(0) => \ap_CS_fsm_reg_n_0_[0]\,
      a_data(63 downto 0) => a_data(63 downto 0),
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      b_data(63 downto 0) => b_data(63 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_return : out STD_LOGIC_VECTOR ( 127 downto 0 );
    a_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    b_data : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bd_0_hls_inst_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bd_0_hls_inst_0 : entity is "bd_0_hls_inst_0,tensor_slice_test,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_0_hls_inst_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of bd_0_hls_inst_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bd_0_hls_inst_0 : entity is "tensor_slice_test,Vivado 2024.1";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0 : entity is "yes";
end bd_0_hls_inst_0;

architecture STRUCTURE of bd_0_hls_inst_0 is
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of inst : label is "4'b1000";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_INFO of ap_rst : signal is "xilinx.com:signal:reset:1.0 ap_rst RST";
  attribute X_INTERFACE_PARAMETER of ap_rst : signal is "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of a_data : signal is "xilinx.com:signal:data:1.0 a_data DATA";
  attribute X_INTERFACE_PARAMETER of a_data : signal is "XIL_INTERFACENAME a_data, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of ap_return : signal is "xilinx.com:signal:data:1.0 ap_return DATA";
  attribute X_INTERFACE_PARAMETER of ap_return : signal is "XIL_INTERFACENAME ap_return, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of b_data : signal is "xilinx.com:signal:data:1.0 b_data DATA";
  attribute X_INTERFACE_PARAMETER of b_data : signal is "XIL_INTERFACENAME b_data, LAYERED_METADATA undef";
begin
inst: entity work.bd_0_hls_inst_0_tensor_slice_test
     port map (
      a_data(63 downto 0) => a_data(63 downto 0),
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_return(127 downto 0) => ap_return(127 downto 0),
      ap_rst => ap_rst,
      ap_start => ap_start,
      b_data(63 downto 0) => b_data(63 downto 0)
    );
end STRUCTURE;
