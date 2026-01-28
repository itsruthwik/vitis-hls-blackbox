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
    id 6 \
    name B \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_B \
    op interface \
    ports { B { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name gmem_b \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_b \
    op interface \
    ports { m_axi_gmem_b_AWVALID { O 1 bit } m_axi_gmem_b_AWREADY { I 1 bit } m_axi_gmem_b_AWADDR { O 64 vector } m_axi_gmem_b_AWID { O 1 vector } m_axi_gmem_b_AWLEN { O 32 vector } m_axi_gmem_b_AWSIZE { O 3 vector } m_axi_gmem_b_AWBURST { O 2 vector } m_axi_gmem_b_AWLOCK { O 2 vector } m_axi_gmem_b_AWCACHE { O 4 vector } m_axi_gmem_b_AWPROT { O 3 vector } m_axi_gmem_b_AWQOS { O 4 vector } m_axi_gmem_b_AWREGION { O 4 vector } m_axi_gmem_b_AWUSER { O 1 vector } m_axi_gmem_b_WVALID { O 1 bit } m_axi_gmem_b_WREADY { I 1 bit } m_axi_gmem_b_WDATA { O 8 vector } m_axi_gmem_b_WSTRB { O 1 vector } m_axi_gmem_b_WLAST { O 1 bit } m_axi_gmem_b_WID { O 1 vector } m_axi_gmem_b_WUSER { O 1 vector } m_axi_gmem_b_ARVALID { O 1 bit } m_axi_gmem_b_ARREADY { I 1 bit } m_axi_gmem_b_ARADDR { O 64 vector } m_axi_gmem_b_ARID { O 1 vector } m_axi_gmem_b_ARLEN { O 32 vector } m_axi_gmem_b_ARSIZE { O 3 vector } m_axi_gmem_b_ARBURST { O 2 vector } m_axi_gmem_b_ARLOCK { O 2 vector } m_axi_gmem_b_ARCACHE { O 4 vector } m_axi_gmem_b_ARPROT { O 3 vector } m_axi_gmem_b_ARQOS { O 4 vector } m_axi_gmem_b_ARREGION { O 4 vector } m_axi_gmem_b_ARUSER { O 1 vector } m_axi_gmem_b_RVALID { I 1 bit } m_axi_gmem_b_RREADY { O 1 bit } m_axi_gmem_b_RDATA { I 8 vector } m_axi_gmem_b_RLAST { I 1 bit } m_axi_gmem_b_RID { I 1 vector } m_axi_gmem_b_RFIFONUM { I 11 vector } m_axi_gmem_b_RUSER { I 1 vector } m_axi_gmem_b_RRESP { I 2 vector } m_axi_gmem_b_BVALID { I 1 bit } m_axi_gmem_b_BREADY { O 1 bit } m_axi_gmem_b_BRESP { I 2 vector } m_axi_gmem_b_BID { I 1 vector } m_axi_gmem_b_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name b_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b_stream \
    op interface \
    ports { b_stream_din { O 64 vector } b_stream_num_data_valid { I 3 vector } b_stream_fifo_cap { I 3 vector } b_stream_full_n { I 1 bit } b_stream_write { O 1 bit } } \
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
set InstName matrix_multiply_8x8_flow_control_loop_pipe_U
set CompName matrix_multiply_8x8_flow_control_loop_pipe
set name flow_control_loop_pipe
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix matrix_multiply_8x8_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


