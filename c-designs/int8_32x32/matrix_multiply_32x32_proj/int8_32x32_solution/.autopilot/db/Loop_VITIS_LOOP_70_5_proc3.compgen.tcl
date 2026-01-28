# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name C \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_C \
    op interface \
    ports { C_dout { I 64 vector } C_num_data_valid { I 4 vector } C_fifo_cap { I 4 vector } C_empty_n { I 1 bit } C_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name gmem_c \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_c \
    op interface \
    ports { m_axi_gmem_c_AWVALID { O 1 bit } m_axi_gmem_c_AWREADY { I 1 bit } m_axi_gmem_c_AWADDR { O 64 vector } m_axi_gmem_c_AWID { O 1 vector } m_axi_gmem_c_AWLEN { O 32 vector } m_axi_gmem_c_AWSIZE { O 3 vector } m_axi_gmem_c_AWBURST { O 2 vector } m_axi_gmem_c_AWLOCK { O 2 vector } m_axi_gmem_c_AWCACHE { O 4 vector } m_axi_gmem_c_AWPROT { O 3 vector } m_axi_gmem_c_AWQOS { O 4 vector } m_axi_gmem_c_AWREGION { O 4 vector } m_axi_gmem_c_AWUSER { O 1 vector } m_axi_gmem_c_WVALID { O 1 bit } m_axi_gmem_c_WREADY { I 1 bit } m_axi_gmem_c_WDATA { O 16 vector } m_axi_gmem_c_WSTRB { O 2 vector } m_axi_gmem_c_WLAST { O 1 bit } m_axi_gmem_c_WID { O 1 vector } m_axi_gmem_c_WUSER { O 1 vector } m_axi_gmem_c_ARVALID { O 1 bit } m_axi_gmem_c_ARREADY { I 1 bit } m_axi_gmem_c_ARADDR { O 64 vector } m_axi_gmem_c_ARID { O 1 vector } m_axi_gmem_c_ARLEN { O 32 vector } m_axi_gmem_c_ARSIZE { O 3 vector } m_axi_gmem_c_ARBURST { O 2 vector } m_axi_gmem_c_ARLOCK { O 2 vector } m_axi_gmem_c_ARCACHE { O 4 vector } m_axi_gmem_c_ARPROT { O 3 vector } m_axi_gmem_c_ARQOS { O 4 vector } m_axi_gmem_c_ARREGION { O 4 vector } m_axi_gmem_c_ARUSER { O 1 vector } m_axi_gmem_c_RVALID { I 1 bit } m_axi_gmem_c_RREADY { O 1 bit } m_axi_gmem_c_RDATA { I 16 vector } m_axi_gmem_c_RLAST { I 1 bit } m_axi_gmem_c_RID { I 1 vector } m_axi_gmem_c_RFIFONUM { I 10 vector } m_axi_gmem_c_RUSER { I 1 vector } m_axi_gmem_c_RRESP { I 2 vector } m_axi_gmem_c_BVALID { I 1 bit } m_axi_gmem_c_BREADY { O 1 bit } m_axi_gmem_c_BRESP { I 2 vector } m_axi_gmem_c_BID { I 1 vector } m_axi_gmem_c_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name c_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_c_stream \
    op interface \
    ports { c_stream_dout { I 512 vector } c_stream_num_data_valid { I 3 vector } c_stream_fifo_cap { I 3 vector } c_stream_empty_n { I 1 bit } c_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName matrix_multiply_32x32_flow_control_loop_pipe_U
set CompName matrix_multiply_32x32_flow_control_loop_pipe
set name flow_control_loop_pipe
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix matrix_multiply_32x32_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


