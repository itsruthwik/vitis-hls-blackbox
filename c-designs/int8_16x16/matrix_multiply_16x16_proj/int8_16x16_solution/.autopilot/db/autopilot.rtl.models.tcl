set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME matrix_multiply_16x16_entry_proc}
  {SRCNAME Loop_VITIS_LOOP_47_1_proc1 MODELNAME Loop_VITIS_LOOP_47_1_proc1 RTLNAME matrix_multiply_16x16_Loop_VITIS_LOOP_47_1_proc1
    SUBMODULES {
      {MODELNAME matrix_multiply_16x16_flow_control_loop_pipe RTLNAME matrix_multiply_16x16_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matrix_multiply_16x16_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_57_3_proc2 MODELNAME Loop_VITIS_LOOP_57_3_proc2 RTLNAME matrix_multiply_16x16_Loop_VITIS_LOOP_57_3_proc2}
  {SRCNAME int8_16x16_wrapper MODELNAME int8_16x16_wrapper RTLNAME matrix_multiply_16x16_int8_16x16_wrapper}
  {SRCNAME int8_16x16_wrapper_wrapper.1 MODELNAME int8_16x16_wrapper_wrapper_1 RTLNAME matrix_multiply_16x16_int8_16x16_wrapper_wrapper_1}
  {SRCNAME Loop_VITIS_LOOP_70_5_proc3 MODELNAME Loop_VITIS_LOOP_70_5_proc3 RTLNAME matrix_multiply_16x16_Loop_VITIS_LOOP_70_5_proc3}
  {SRCNAME matrix_multiply_16x16 MODELNAME matrix_multiply_16x16 RTLNAME matrix_multiply_16x16 IS_TOP 1
    SUBMODULES {
      {MODELNAME matrix_multiply_16x16_fifo_w64_d4_S RTLNAME matrix_multiply_16x16_fifo_w64_d4_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME C_c_U}
      {MODELNAME matrix_multiply_16x16_fifo_w128_d2_S RTLNAME matrix_multiply_16x16_fifo_w128_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME a_stream_U}
      {MODELNAME matrix_multiply_16x16_fifo_w128_d2_S RTLNAME matrix_multiply_16x16_fifo_w128_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME b_stream_U}
      {MODELNAME matrix_multiply_16x16_fifo_w256_d2_S RTLNAME matrix_multiply_16x16_fifo_w256_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME c_stream_U}
      {MODELNAME matrix_multiply_16x16_start_for_Loop_VITIS_LOOP_70_5_proc3_U0 RTLNAME matrix_multiply_16x16_start_for_Loop_VITIS_LOOP_70_5_proc3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Loop_VITIS_LOOP_70_5_proc3_U0_U}
      {MODELNAME matrix_multiply_16x16_start_for_int8_16x16_wrapper_wrapper_1_U0 RTLNAME matrix_multiply_16x16_start_for_int8_16x16_wrapper_wrapper_1_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_int8_16x16_wrapper_wrapper_1_U0_U}
      {MODELNAME matrix_multiply_16x16_gmem_a_m_axi RTLNAME matrix_multiply_16x16_gmem_a_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_16x16_gmem_b_m_axi RTLNAME matrix_multiply_16x16_gmem_b_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_16x16_gmem_c_m_axi RTLNAME matrix_multiply_16x16_gmem_c_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME matrix_multiply_16x16_control_s_axi RTLNAME matrix_multiply_16x16_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
