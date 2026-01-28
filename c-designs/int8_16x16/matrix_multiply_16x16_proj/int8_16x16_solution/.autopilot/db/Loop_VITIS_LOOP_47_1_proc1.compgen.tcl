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
    id 3 \
    name gmem_a \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_a \
    op interface \
    ports { m_axi_gmem_a_AWVALID { O 1 bit } m_axi_gmem_a_AWREADY { I 1 bit } m_axi_gmem_a_AWADDR { O 64 vector } m_axi_gmem_a_AWID { O 1 vector } m_axi_gmem_a_AWLEN { O 32 vector } m_axi_gmem_a_AWSIZE { O 3 vector } m_axi_gmem_a_AWBURST { O 2 vector } m_axi_gmem_a_AWLOCK { O 2 vector } m_axi_gmem_a_AWCACHE { O 4 vector } m_axi_gmem_a_AWPROT { O 3 vector } m_axi_gmem_a_AWQOS { O 4 vector } m_axi_gmem_a_AWREGION { O 4 vector } m_axi_gmem_a_AWUSER { O 1 vector } m_axi_gmem_a_WVALID { O 1 bit } m_axi_gmem_a_WREADY { I 1 bit } m_axi_gmem_a_WDATA { O 8 vector } m_axi_gmem_a_WSTRB { O 1 vector } m_axi_gmem_a_WLAST { O 1 bit } m_axi_gmem_a_WID { O 1 vector } m_axi_gmem_a_WUSER { O 1 vector } m_axi_gmem_a_ARVALID { O 1 bit } m_axi_gmem_a_ARREADY { I 1 bit } m_axi_gmem_a_ARADDR { O 64 vector } m_axi_gmem_a_ARID { O 1 vector } m_axi_gmem_a_ARLEN { O 32 vector } m_axi_gmem_a_ARSIZE { O 3 vector } m_axi_gmem_a_ARBURST { O 2 vector } m_axi_gmem_a_ARLOCK { O 2 vector } m_axi_gmem_a_ARCACHE { O 4 vector } m_axi_gmem_a_ARPROT { O 3 vector } m_axi_gmem_a_ARQOS { O 4 vector } m_axi_gmem_a_ARREGION { O 4 vector } m_axi_gmem_a_ARUSER { O 1 vector } m_axi_gmem_a_RVALID { I 1 bit } m_axi_gmem_a_RREADY { O 1 bit } m_axi_gmem_a_RDATA { I 8 vector } m_axi_gmem_a_RLAST { I 1 bit } m_axi_gmem_a_RID { I 1 vector } m_axi_gmem_a_RFIFONUM { I 11 vector } m_axi_gmem_a_RUSER { I 1 vector } m_axi_gmem_a_RRESP { I 2 vector } m_axi_gmem_a_BVALID { I 1 bit } m_axi_gmem_a_BREADY { O 1 bit } m_axi_gmem_a_BRESP { I 2 vector } m_axi_gmem_a_BID { I 1 vector } m_axi_gmem_a_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name A \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_A \
    op interface \
    ports { A { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name a_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_a_stream \
    op interface \
    ports { a_stream_din { O 128 vector } a_stream_num_data_valid { I 3 vector } a_stream_fifo_cap { I 3 vector } a_stream_full_n { I 1 bit } a_stream_write { O 1 bit } } \
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
set InstName matrix_multiply_16x16_flow_control_loop_pipe_U
set CompName matrix_multiply_16x16_flow_control_loop_pipe
set name flow_control_loop_pipe
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix matrix_multiply_16x16_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


