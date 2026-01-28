set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME matrix_multiply_32x32_entry_proc}
  {SRCNAME Loop_VITIS_LOOP_47_1_proc2 MODELNAME Loop_VITIS_LOOP_47_1_proc2 RTLNAME matrix_multiply_32x32_Loop_VITIS_LOOP_47_1_proc2
    SUBMODULES {
      {MODELNAME matrix_multiply_32x32_flow_control_loop_pipe RTLNAME matrix_multiply_32x32_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matrix_multiply_32x32_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME Block_VITIS_LOOP_57_3_proc MODELNAME Block_VITIS_LOOP_57_3_proc RTLNAME matrix_multiply_32x32_Block_VITIS_LOOP_57_3_proc}
  {SRCNAME Loop_VITIS_LOOP_57_3_proc MODELNAME Loop_VITIS_LOOP_57_3_proc RTLNAME matrix_multiply_32x32_Loop_VITIS_LOOP_57_3_proc}
  {SRCNAME int8_32x32_wrapper MODELNAME int8_32x32_wrapper RTLNAME matrix_multiply_32x32_int8_32x32_wrapper}
  {SRCNAME int8_32x32_wrapper_wrapper.1 MODELNAME int8_32x32_wrapper_wrapper_1 RTLNAME matrix_multiply_32x32_int8_32x32_wrapper_wrapper_1}
  {SRCNAME Loop_VITIS_LOOP_70_5_proc3 MODELNAME Loop_VITIS_LOOP_70_5_proc3 RTLNAME matrix_multiply_32x32_Loop_VITIS_LOOP_70_5_proc3}
  {SRCNAME matrix_multiply_32x32 MODELNAME matrix_multiply_32x32 RTLNAME matrix_multiply_32x32 IS_TOP 1
    SUBMODULES {
      {MODELNAME matrix_multiply_32x32_fifo_w64_d5_S RTLNAME matrix_multiply_32x32_fifo_w64_d5_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME C_c_U}
      {MODELNAME matrix_multiply_32x32_fifo_w256_d2_S RTLNAME matrix_multiply_32x32_fifo_w256_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME a_stream_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc36_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc37_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc38_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc39_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc40_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc41_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc42_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc43_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc44_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc45_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc46_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc47_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc48_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc49_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc50_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc51_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc52_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc53_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc54_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc55_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc56_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc57_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc58_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc59_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc60_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc61_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc62_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc63_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc64_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w64_d2_S RTLNAME matrix_multiply_32x32_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME p_loc65_channel_U}
      {MODELNAME matrix_multiply_32x32_fifo_w256_d2_S RTLNAME matrix_multiply_32x32_fifo_w256_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME b_stream_U}
      {MODELNAME matrix_multiply_32x32_fifo_w512_d2_S RTLNAME matrix_multiply_32x32_fifo_w512_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME c_stream_U}
      {MODELNAME matrix_multiply_32x32_start_for_Loop_VITIS_LOOP_70_5_proc3_U0 RTLNAME matrix_multiply_32x32_start_for_Loop_VITIS_LOOP_70_5_proc3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_70_5_proc3_U0_U}
      {MODELNAME matrix_multiply_32x32_start_for_int8_32x32_wrapper_wrapper_1_U0 RTLNAME matrix_multiply_32x32_start_for_int8_32x32_wrapper_wrapper_1_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_int8_32x32_wrapper_wrapper_1_U0_U}
      {MODELNAME matrix_multiply_32x32_gmem_a_m_axi RTLNAME matrix_multiply_32x32_gmem_a_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_32x32_gmem_b_m_axi RTLNAME matrix_multiply_32x32_gmem_b_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_32x32_gmem_c_m_axi RTLNAME matrix_multiply_32x32_gmem_c_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_32x32_control_s_axi RTLNAME matrix_multiply_32x32_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
