set moduleName Loop_VITIS_LOOP_45_1_proc1
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
set C_modelName {Loop_VITIS_LOOP_45_1_proc1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ gmem_a int 8 regular {axi_master 0}  }
	{ A int 64 regular  }
	{ a_stream int 64 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_a", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "A","offset": { "type": "dynamic","port_name": "A","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "A", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "a_stream", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 62
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_a_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_a_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_a_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_a_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_a_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_WDATA sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_a_WSTRB sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_a_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_a_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_a_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_a_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_RDATA sc_in sc_lv 8 signal 0 } 
	{ m_axi_gmem_a_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_RFIFONUM sc_in sc_lv 11 signal 0 } 
	{ m_axi_gmem_a_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_BUSER sc_in sc_lv 1 signal 0 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ A sc_in sc_lv 64 signal 1 } 
	{ a_stream_din sc_out sc_lv 64 signal 2 } 
	{ a_stream_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ a_stream_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ a_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ a_stream_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_a_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_a_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_a_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_a_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_a_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_a_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_a_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_a_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_a_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_a_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_a_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_a_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_a_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_a_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_a_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_a_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_a", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_a_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_a_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_a_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_a_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_a_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_a_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_a_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_a_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_a_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_a_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_a_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_a_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_a_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_a_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_a_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_a_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_a_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_a_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_a_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_a_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_a", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_a_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_a_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_a_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "gmem_a", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_a_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_a_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_a_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_a_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_a_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_a_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_a_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BUSER" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "A", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "default" }} , 
 	{ "name": "a_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_stream", "role": "din" }} , 
 	{ "name": "a_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_stream", "role": "num_data_valid" }} , 
 	{ "name": "a_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_stream", "role": "fifo_cap" }} , 
 	{ "name": "a_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_stream", "role": "full_n" }} , 
 	{ "name": "a_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_stream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_VITIS_LOOP_45_1_proc1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "75", "EstimateLatencyMax" : "75",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem_a", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_a_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_a_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "a_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_45_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_45_1_proc1 {
		gmem_a {Type I LastRead 16 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		a_stream {Type O LastRead -1 FirstWrite 17}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "75", "Max" : "75"}
	, {"Name" : "Interval", "Min" : "75", "Max" : "75"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem_a_AWVALID VALID 1 1 }  { m_axi_gmem_a_AWREADY READY 0 1 }  { m_axi_gmem_a_AWADDR ADDR 1 64 }  { m_axi_gmem_a_AWID ID 1 1 }  { m_axi_gmem_a_AWLEN SIZE 1 32 }  { m_axi_gmem_a_AWSIZE BURST 1 3 }  { m_axi_gmem_a_AWBURST LOCK 1 2 }  { m_axi_gmem_a_AWLOCK CACHE 1 2 }  { m_axi_gmem_a_AWCACHE PROT 1 4 }  { m_axi_gmem_a_AWPROT QOS 1 3 }  { m_axi_gmem_a_AWQOS REGION 1 4 }  { m_axi_gmem_a_AWREGION USER 1 4 }  { m_axi_gmem_a_AWUSER DATA 1 1 }  { m_axi_gmem_a_WVALID VALID 1 1 }  { m_axi_gmem_a_WREADY READY 0 1 }  { m_axi_gmem_a_WDATA FIFONUM 1 8 }  { m_axi_gmem_a_WSTRB STRB 1 1 }  { m_axi_gmem_a_WLAST LAST 1 1 }  { m_axi_gmem_a_WID ID 1 1 }  { m_axi_gmem_a_WUSER DATA 1 1 }  { m_axi_gmem_a_ARVALID VALID 1 1 }  { m_axi_gmem_a_ARREADY READY 0 1 }  { m_axi_gmem_a_ARADDR ADDR 1 64 }  { m_axi_gmem_a_ARID ID 1 1 }  { m_axi_gmem_a_ARLEN SIZE 1 32 }  { m_axi_gmem_a_ARSIZE BURST 1 3 }  { m_axi_gmem_a_ARBURST LOCK 1 2 }  { m_axi_gmem_a_ARLOCK CACHE 1 2 }  { m_axi_gmem_a_ARCACHE PROT 1 4 }  { m_axi_gmem_a_ARPROT QOS 1 3 }  { m_axi_gmem_a_ARQOS REGION 1 4 }  { m_axi_gmem_a_ARREGION USER 1 4 }  { m_axi_gmem_a_ARUSER DATA 1 1 }  { m_axi_gmem_a_RVALID VALID 0 1 }  { m_axi_gmem_a_RREADY READY 1 1 }  { m_axi_gmem_a_RDATA FIFONUM 0 8 }  { m_axi_gmem_a_RLAST LAST 0 1 }  { m_axi_gmem_a_RID ID 0 1 }  { m_axi_gmem_a_RFIFONUM LEN 0 11 }  { m_axi_gmem_a_RUSER DATA 0 1 }  { m_axi_gmem_a_RRESP RESP 0 2 }  { m_axi_gmem_a_BVALID VALID 0 1 }  { m_axi_gmem_a_BREADY READY 1 1 }  { m_axi_gmem_a_BRESP RESP 0 2 }  { m_axi_gmem_a_BID ID 0 1 }  { m_axi_gmem_a_BUSER DATA 0 1 } } }
	A { ap_none {  { A in_data 0 64 } } }
	a_stream { ap_fifo {  { a_stream_din fifo_data_in 1 64 }  { a_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { a_stream_fifo_cap fifo_update 0 3 }  { a_stream_full_n fifo_status 0 1 }  { a_stream_write fifo_port_we 1 1 } } }
}
