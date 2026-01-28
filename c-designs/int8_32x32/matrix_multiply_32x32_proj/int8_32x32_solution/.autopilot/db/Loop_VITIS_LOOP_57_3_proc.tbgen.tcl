set moduleName Loop_VITIS_LOOP_57_3_proc
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
set C_modelName {Loop_VITIS_LOOP_57_3_proc}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ B int 64 regular  }
	{ gmem_b int 8 regular {axi_master 0}  }
	{ p_read int 64 regular  }
	{ p_read1 int 64 regular  }
	{ p_read2 int 64 regular  }
	{ p_read3 int 64 regular  }
	{ p_read4 int 64 regular  }
	{ p_read5 int 64 regular  }
	{ p_read6 int 64 regular  }
	{ p_read7 int 64 regular  }
	{ p_read8 int 64 regular  }
	{ p_read9 int 64 regular  }
	{ p_read10 int 64 regular  }
	{ p_read11 int 64 regular  }
	{ p_read12 int 64 regular  }
	{ p_read13 int 64 regular  }
	{ p_read14 int 64 regular  }
	{ p_read15 int 64 regular  }
	{ p_read16 int 64 regular  }
	{ p_read17 int 64 regular  }
	{ p_read18 int 64 regular  }
	{ p_read19 int 64 regular  }
	{ p_read20 int 64 regular  }
	{ p_read21 int 64 regular  }
	{ p_read22 int 64 regular  }
	{ p_read23 int 64 regular  }
	{ p_read24 int 64 regular  }
	{ p_read25 int 64 regular  }
	{ p_read26 int 64 regular  }
	{ p_read27 int 64 regular  }
	{ p_read28 int 64 regular  }
	{ p_read29 int 64 regular  }
	{ p_read30 int 64 regular  }
	{ b_stream int 256 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "B", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_b", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "B","offset": { "type": "dynamic","port_name": "B","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read5", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read6", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read7", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read8", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read9", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read10", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read11", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read12", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read13", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read14", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read15", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read16", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read17", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read18", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read19", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read20", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read21", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read22", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read23", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read24", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read25", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read26", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read27", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read28", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read29", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read30", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "b_stream", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 90
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_b_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_b_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_b_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_b_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_b_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_WDATA sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem_b_WSTRB sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_b_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_b_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_b_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_b_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_RDATA sc_in sc_lv 8 signal 1 } 
	{ m_axi_gmem_b_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_RFIFONUM sc_in sc_lv 11 signal 1 } 
	{ m_axi_gmem_b_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_BUSER sc_in sc_lv 1 signal 1 } 
	{ B sc_in sc_lv 64 signal 0 } 
	{ p_read sc_in sc_lv 64 signal 2 } 
	{ p_read1 sc_in sc_lv 64 signal 3 } 
	{ p_read2 sc_in sc_lv 64 signal 4 } 
	{ p_read3 sc_in sc_lv 64 signal 5 } 
	{ p_read4 sc_in sc_lv 64 signal 6 } 
	{ p_read5 sc_in sc_lv 64 signal 7 } 
	{ p_read6 sc_in sc_lv 64 signal 8 } 
	{ p_read7 sc_in sc_lv 64 signal 9 } 
	{ p_read8 sc_in sc_lv 64 signal 10 } 
	{ p_read9 sc_in sc_lv 64 signal 11 } 
	{ p_read10 sc_in sc_lv 64 signal 12 } 
	{ p_read11 sc_in sc_lv 64 signal 13 } 
	{ p_read12 sc_in sc_lv 64 signal 14 } 
	{ p_read13 sc_in sc_lv 64 signal 15 } 
	{ p_read14 sc_in sc_lv 64 signal 16 } 
	{ p_read15 sc_in sc_lv 64 signal 17 } 
	{ p_read16 sc_in sc_lv 64 signal 18 } 
	{ p_read17 sc_in sc_lv 64 signal 19 } 
	{ p_read18 sc_in sc_lv 64 signal 20 } 
	{ p_read19 sc_in sc_lv 64 signal 21 } 
	{ p_read20 sc_in sc_lv 64 signal 22 } 
	{ p_read21 sc_in sc_lv 64 signal 23 } 
	{ p_read22 sc_in sc_lv 64 signal 24 } 
	{ p_read23 sc_in sc_lv 64 signal 25 } 
	{ p_read24 sc_in sc_lv 64 signal 26 } 
	{ p_read25 sc_in sc_lv 64 signal 27 } 
	{ p_read26 sc_in sc_lv 64 signal 28 } 
	{ p_read27 sc_in sc_lv 64 signal 29 } 
	{ p_read28 sc_in sc_lv 64 signal 30 } 
	{ p_read29 sc_in sc_lv 64 signal 31 } 
	{ p_read30 sc_in sc_lv 64 signal 32 } 
	{ b_stream_din sc_out sc_lv 256 signal 33 } 
	{ b_stream_num_data_valid sc_in sc_lv 3 signal 33 } 
	{ b_stream_fifo_cap sc_in sc_lv 3 signal 33 } 
	{ b_stream_full_n sc_in sc_logic 1 signal 33 } 
	{ b_stream_write sc_out sc_logic 1 signal 33 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_b_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_b_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_b_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_b_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_b_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_b_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_b_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_b_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_b_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_b_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_b_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_b_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_b_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_b_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_b_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_b_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_b", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_b_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_b_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_b_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_b_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_b_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_b_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_b_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_b_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_b_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_b_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_b_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_b_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_b_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_b_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_b_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_b_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_b_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_b_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_b_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_b_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_b", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_b_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_b_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_b_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "gmem_b", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_b_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_b_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_b_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_b_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_b_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_b_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_b_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BUSER" }} , 
 	{ "name": "B", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "p_read5", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read5", "role": "default" }} , 
 	{ "name": "p_read6", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read6", "role": "default" }} , 
 	{ "name": "p_read7", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read7", "role": "default" }} , 
 	{ "name": "p_read8", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read8", "role": "default" }} , 
 	{ "name": "p_read9", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read9", "role": "default" }} , 
 	{ "name": "p_read10", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read10", "role": "default" }} , 
 	{ "name": "p_read11", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read11", "role": "default" }} , 
 	{ "name": "p_read12", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read12", "role": "default" }} , 
 	{ "name": "p_read13", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read13", "role": "default" }} , 
 	{ "name": "p_read14", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read14", "role": "default" }} , 
 	{ "name": "p_read15", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read15", "role": "default" }} , 
 	{ "name": "p_read16", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read16", "role": "default" }} , 
 	{ "name": "p_read17", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read17", "role": "default" }} , 
 	{ "name": "p_read18", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read18", "role": "default" }} , 
 	{ "name": "p_read19", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read19", "role": "default" }} , 
 	{ "name": "p_read20", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read20", "role": "default" }} , 
 	{ "name": "p_read21", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read21", "role": "default" }} , 
 	{ "name": "p_read22", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read22", "role": "default" }} , 
 	{ "name": "p_read23", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read23", "role": "default" }} , 
 	{ "name": "p_read24", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read24", "role": "default" }} , 
 	{ "name": "p_read25", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read25", "role": "default" }} , 
 	{ "name": "p_read26", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read26", "role": "default" }} , 
 	{ "name": "p_read27", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read27", "role": "default" }} , 
 	{ "name": "p_read28", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read28", "role": "default" }} , 
 	{ "name": "p_read29", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read29", "role": "default" }} , 
 	{ "name": "p_read30", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read30", "role": "default" }} , 
 	{ "name": "b_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_stream", "role": "din" }} , 
 	{ "name": "b_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b_stream", "role": "num_data_valid" }} , 
 	{ "name": "b_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b_stream", "role": "fifo_cap" }} , 
 	{ "name": "b_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_stream", "role": "full_n" }} , 
 	{ "name": "b_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_stream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_VITIS_LOOP_57_3_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1035", "EstimateLatencyMax" : "1035",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "B", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem_b", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_b_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_b_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "b_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "b_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_57_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage9", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage9_subdone", "QuitState" : "ap_ST_fsm_pp0_stage9", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage9_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_57_3_proc {
		B {Type I LastRead 0 FirstWrite -1}
		gmem_b {Type I LastRead 40 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		p_read9 {Type I LastRead 0 FirstWrite -1}
		p_read10 {Type I LastRead 0 FirstWrite -1}
		p_read11 {Type I LastRead 0 FirstWrite -1}
		p_read12 {Type I LastRead 0 FirstWrite -1}
		p_read13 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read15 {Type I LastRead 0 FirstWrite -1}
		p_read16 {Type I LastRead 0 FirstWrite -1}
		p_read17 {Type I LastRead 0 FirstWrite -1}
		p_read18 {Type I LastRead 0 FirstWrite -1}
		p_read19 {Type I LastRead 0 FirstWrite -1}
		p_read20 {Type I LastRead 0 FirstWrite -1}
		p_read21 {Type I LastRead 0 FirstWrite -1}
		p_read22 {Type I LastRead 0 FirstWrite -1}
		p_read23 {Type I LastRead 0 FirstWrite -1}
		p_read24 {Type I LastRead 0 FirstWrite -1}
		p_read25 {Type I LastRead 0 FirstWrite -1}
		p_read26 {Type I LastRead 0 FirstWrite -1}
		p_read27 {Type I LastRead 0 FirstWrite -1}
		p_read28 {Type I LastRead 0 FirstWrite -1}
		p_read29 {Type I LastRead 0 FirstWrite -1}
		p_read30 {Type I LastRead 0 FirstWrite -1}
		b_stream {Type O LastRead -1 FirstWrite 41}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1035", "Max" : "1035"}
	, {"Name" : "Interval", "Min" : "1035", "Max" : "1035"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	B { ap_none {  { B in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem_b_AWVALID VALID 1 1 }  { m_axi_gmem_b_AWREADY READY 0 1 }  { m_axi_gmem_b_AWADDR ADDR 1 64 }  { m_axi_gmem_b_AWID ID 1 1 }  { m_axi_gmem_b_AWLEN SIZE 1 32 }  { m_axi_gmem_b_AWSIZE BURST 1 3 }  { m_axi_gmem_b_AWBURST LOCK 1 2 }  { m_axi_gmem_b_AWLOCK CACHE 1 2 }  { m_axi_gmem_b_AWCACHE PROT 1 4 }  { m_axi_gmem_b_AWPROT QOS 1 3 }  { m_axi_gmem_b_AWQOS REGION 1 4 }  { m_axi_gmem_b_AWREGION USER 1 4 }  { m_axi_gmem_b_AWUSER DATA 1 1 }  { m_axi_gmem_b_WVALID VALID 1 1 }  { m_axi_gmem_b_WREADY READY 0 1 }  { m_axi_gmem_b_WDATA FIFONUM 1 8 }  { m_axi_gmem_b_WSTRB STRB 1 1 }  { m_axi_gmem_b_WLAST LAST 1 1 }  { m_axi_gmem_b_WID ID 1 1 }  { m_axi_gmem_b_WUSER DATA 1 1 }  { m_axi_gmem_b_ARVALID VALID 1 1 }  { m_axi_gmem_b_ARREADY READY 0 1 }  { m_axi_gmem_b_ARADDR ADDR 1 64 }  { m_axi_gmem_b_ARID ID 1 1 }  { m_axi_gmem_b_ARLEN SIZE 1 32 }  { m_axi_gmem_b_ARSIZE BURST 1 3 }  { m_axi_gmem_b_ARBURST LOCK 1 2 }  { m_axi_gmem_b_ARLOCK CACHE 1 2 }  { m_axi_gmem_b_ARCACHE PROT 1 4 }  { m_axi_gmem_b_ARPROT QOS 1 3 }  { m_axi_gmem_b_ARQOS REGION 1 4 }  { m_axi_gmem_b_ARREGION USER 1 4 }  { m_axi_gmem_b_ARUSER DATA 1 1 }  { m_axi_gmem_b_RVALID VALID 0 1 }  { m_axi_gmem_b_RREADY READY 1 1 }  { m_axi_gmem_b_RDATA FIFONUM 0 8 }  { m_axi_gmem_b_RLAST LAST 0 1 }  { m_axi_gmem_b_RID ID 0 1 }  { m_axi_gmem_b_RFIFONUM LEN 0 11 }  { m_axi_gmem_b_RUSER DATA 0 1 }  { m_axi_gmem_b_RRESP RESP 0 2 }  { m_axi_gmem_b_BVALID VALID 0 1 }  { m_axi_gmem_b_BREADY READY 1 1 }  { m_axi_gmem_b_BRESP RESP 0 2 }  { m_axi_gmem_b_BID ID 0 1 }  { m_axi_gmem_b_BUSER DATA 0 1 } } }
	p_read { ap_none {  { p_read in_data 0 64 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 64 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 64 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 64 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 64 } } }
	p_read5 { ap_none {  { p_read5 in_data 0 64 } } }
	p_read6 { ap_none {  { p_read6 in_data 0 64 } } }
	p_read7 { ap_none {  { p_read7 in_data 0 64 } } }
	p_read8 { ap_none {  { p_read8 in_data 0 64 } } }
	p_read9 { ap_none {  { p_read9 in_data 0 64 } } }
	p_read10 { ap_none {  { p_read10 in_data 0 64 } } }
	p_read11 { ap_none {  { p_read11 in_data 0 64 } } }
	p_read12 { ap_none {  { p_read12 in_data 0 64 } } }
	p_read13 { ap_none {  { p_read13 in_data 0 64 } } }
	p_read14 { ap_none {  { p_read14 in_data 0 64 } } }
	p_read15 { ap_none {  { p_read15 in_data 0 64 } } }
	p_read16 { ap_none {  { p_read16 in_data 0 64 } } }
	p_read17 { ap_none {  { p_read17 in_data 0 64 } } }
	p_read18 { ap_none {  { p_read18 in_data 0 64 } } }
	p_read19 { ap_none {  { p_read19 in_data 0 64 } } }
	p_read20 { ap_none {  { p_read20 in_data 0 64 } } }
	p_read21 { ap_none {  { p_read21 in_data 0 64 } } }
	p_read22 { ap_none {  { p_read22 in_data 0 64 } } }
	p_read23 { ap_none {  { p_read23 in_data 0 64 } } }
	p_read24 { ap_none {  { p_read24 in_data 0 64 } } }
	p_read25 { ap_none {  { p_read25 in_data 0 64 } } }
	p_read26 { ap_none {  { p_read26 in_data 0 64 } } }
	p_read27 { ap_none {  { p_read27 in_data 0 64 } } }
	p_read28 { ap_none {  { p_read28 in_data 0 64 } } }
	p_read29 { ap_none {  { p_read29 in_data 0 64 } } }
	p_read30 { ap_none {  { p_read30 in_data 0 64 } } }
	b_stream { ap_fifo {  { b_stream_din fifo_data_in 1 256 }  { b_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { b_stream_fifo_cap fifo_update 0 3 }  { b_stream_full_n fifo_status 0 1 }  { b_stream_write fifo_port_we 1 1 } } }
}
