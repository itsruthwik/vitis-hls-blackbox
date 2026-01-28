set moduleName Loop_VITIS_LOOP_70_5_proc3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {Loop_VITIS_LOOP_70_5_proc3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ C int 64 regular {fifo 0}  }
	{ gmem_c int 16 regular {axi_master 1}  }
	{ c_stream int 512 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "C", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_c", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "C","offset": { "type": "dynamic","port_name": "C","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "c_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 63
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ C_dout sc_in sc_lv 64 signal 0 } 
	{ C_num_data_valid sc_in sc_lv 4 signal 0 } 
	{ C_fifo_cap sc_in sc_lv 4 signal 0 } 
	{ C_empty_n sc_in sc_logic 1 signal 0 } 
	{ C_read sc_out sc_logic 1 signal 0 } 
	{ c_stream_dout sc_in sc_lv 512 signal 2 } 
	{ c_stream_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ c_stream_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ c_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ c_stream_read sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_c_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_c_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_c_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_c_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_WDATA sc_out sc_lv 16 signal 1 } 
	{ m_axi_gmem_c_WSTRB sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_c_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_c_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_c_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_c_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_c_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_RDATA sc_in sc_lv 16 signal 1 } 
	{ m_axi_gmem_c_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_RFIFONUM sc_in sc_lv 10 signal 1 } 
	{ m_axi_gmem_c_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_c_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_c_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_BUSER sc_in sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "C_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "C", "role": "dout" }} , 
 	{ "name": "C_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "C", "role": "num_data_valid" }} , 
 	{ "name": "C_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "C", "role": "fifo_cap" }} , 
 	{ "name": "C_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "empty_n" }} , 
 	{ "name": "C_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "read" }} , 
 	{ "name": "c_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "c_stream", "role": "dout" }} , 
 	{ "name": "c_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c_stream", "role": "num_data_valid" }} , 
 	{ "name": "c_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c_stream", "role": "fifo_cap" }} , 
 	{ "name": "c_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_stream", "role": "empty_n" }} , 
 	{ "name": "c_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_stream", "role": "read" }} , 
 	{ "name": "m_axi_gmem_c_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_c_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_c_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_c_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_c_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_c_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_c_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_c_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_c_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_c_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_c_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_c_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_c_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_c_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_c_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_c_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_c", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_c_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_c_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_c_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_c_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_c_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_c_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_c_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_c_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_c_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_c_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_c_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_c_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_c_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_c_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_c_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_c_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_c_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_c_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_c_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_c_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_c", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_c_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_c_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_c_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gmem_c", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_c_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_c_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_c_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_c_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_c_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_c_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_c_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_VITIS_LOOP_70_5_proc3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1033", "EstimateLatencyMax" : "1033",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "C", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "C_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem_c", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_c_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_c_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_c_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "c_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0","-1"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "c_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_70_5_VITIS_LOOP_72_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_70_5_proc3 {
		C {Type I LastRead 1 FirstWrite -1}
		gmem_c {Type O LastRead 4 FirstWrite 3}
		c_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1033", "Max" : "1033"}
	, {"Name" : "Interval", "Min" : "1033", "Max" : "1033"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	C { ap_fifo {  { C_dout fifo_data_in 0 64 }  { C_num_data_valid fifo_status_num_data_valid 0 4 }  { C_fifo_cap fifo_update 0 4 }  { C_empty_n fifo_status 0 1 }  { C_read fifo_port_we 1 1 } } }
	 { m_axi {  { m_axi_gmem_c_AWVALID VALID 1 1 }  { m_axi_gmem_c_AWREADY READY 0 1 }  { m_axi_gmem_c_AWADDR ADDR 1 64 }  { m_axi_gmem_c_AWID ID 1 1 }  { m_axi_gmem_c_AWLEN SIZE 1 32 }  { m_axi_gmem_c_AWSIZE BURST 1 3 }  { m_axi_gmem_c_AWBURST LOCK 1 2 }  { m_axi_gmem_c_AWLOCK CACHE 1 2 }  { m_axi_gmem_c_AWCACHE PROT 1 4 }  { m_axi_gmem_c_AWPROT QOS 1 3 }  { m_axi_gmem_c_AWQOS REGION 1 4 }  { m_axi_gmem_c_AWREGION USER 1 4 }  { m_axi_gmem_c_AWUSER DATA 1 1 }  { m_axi_gmem_c_WVALID VALID 1 1 }  { m_axi_gmem_c_WREADY READY 0 1 }  { m_axi_gmem_c_WDATA FIFONUM 1 16 }  { m_axi_gmem_c_WSTRB STRB 1 2 }  { m_axi_gmem_c_WLAST LAST 1 1 }  { m_axi_gmem_c_WID ID 1 1 }  { m_axi_gmem_c_WUSER DATA 1 1 }  { m_axi_gmem_c_ARVALID VALID 1 1 }  { m_axi_gmem_c_ARREADY READY 0 1 }  { m_axi_gmem_c_ARADDR ADDR 1 64 }  { m_axi_gmem_c_ARID ID 1 1 }  { m_axi_gmem_c_ARLEN SIZE 1 32 }  { m_axi_gmem_c_ARSIZE BURST 1 3 }  { m_axi_gmem_c_ARBURST LOCK 1 2 }  { m_axi_gmem_c_ARLOCK CACHE 1 2 }  { m_axi_gmem_c_ARCACHE PROT 1 4 }  { m_axi_gmem_c_ARPROT QOS 1 3 }  { m_axi_gmem_c_ARQOS REGION 1 4 }  { m_axi_gmem_c_ARREGION USER 1 4 }  { m_axi_gmem_c_ARUSER DATA 1 1 }  { m_axi_gmem_c_RVALID VALID 0 1 }  { m_axi_gmem_c_RREADY READY 1 1 }  { m_axi_gmem_c_RDATA FIFONUM 0 16 }  { m_axi_gmem_c_RLAST LAST 0 1 }  { m_axi_gmem_c_RID ID 0 1 }  { m_axi_gmem_c_RFIFONUM LEN 0 10 }  { m_axi_gmem_c_RUSER DATA 0 1 }  { m_axi_gmem_c_RRESP RESP 0 2 }  { m_axi_gmem_c_BVALID VALID 0 1 }  { m_axi_gmem_c_BREADY READY 1 1 }  { m_axi_gmem_c_BRESP RESP 0 2 }  { m_axi_gmem_c_BID ID 0 1 }  { m_axi_gmem_c_BUSER DATA 0 1 } } }
	c_stream { ap_fifo {  { c_stream_dout fifo_data_in 0 512 }  { c_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { c_stream_fifo_cap fifo_update 0 3 }  { c_stream_empty_n fifo_status 0 1 }  { c_stream_read fifo_port_we 1 1 } } }
}
