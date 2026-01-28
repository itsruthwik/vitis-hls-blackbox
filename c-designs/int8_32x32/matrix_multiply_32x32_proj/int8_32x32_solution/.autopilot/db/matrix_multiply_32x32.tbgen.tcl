set moduleName matrix_multiply_32x32
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {matrix_multiply_32x32}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ gmem_a int 8 regular {axi_master 0}  }
	{ gmem_b int 8 regular {axi_master 0}  }
	{ gmem_c int 16 regular {axi_master 1}  }
	{ A int 64 regular {axi_slave 0}  }
	{ B int 64 regular {axi_slave 0}  }
	{ C int 64 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_a", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "A","offset": { "type": "dynamic","port_name": "A","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_b", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "B","offset": { "type": "dynamic","port_name": "B","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_c", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "C","offset": { "type": "dynamic","port_name": "C","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "A", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "B", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "C", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} ]}
# RTL Port declarations: 
set portNum 155
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_gmem_a_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_a_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_gmem_a_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_a_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_a_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_a_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_gmem_a_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_a_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_a_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_a_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_a_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_b_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_b_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_AWLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_gmem_b_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_b_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_b_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_b_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_ARLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_gmem_b_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem_b_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_b_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_b_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_b_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_c_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_c_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_gmem_c_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_c_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_c_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_c_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_c_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_gmem_c_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_c_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_c_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_c_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_gmem_c_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_c_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_c_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_c_BUSER sc_in sc_lv 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"matrix_multiply_32x32","role":"start","value":"0","valid_bit":"0"},{"name":"matrix_multiply_32x32","role":"continue","value":"0","valid_bit":"4"},{"name":"matrix_multiply_32x32","role":"auto_start","value":"0","valid_bit":"7"},{"name":"A","role":"data","value":"16"},{"name":"B","role":"data","value":"28"},{"name":"C","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"matrix_multiply_32x32","role":"start","value":"0","valid_bit":"0"},{"name":"matrix_multiply_32x32","role":"done","value":"0","valid_bit":"1"},{"name":"matrix_multiply_32x32","role":"idle","value":"0","valid_bit":"2"},{"name":"matrix_multiply_32x32","role":"ready","value":"0","valid_bit":"3"},{"name":"matrix_multiply_32x32","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_a_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_a_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_a_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_a_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_a_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_a", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_gmem_a_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_a", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_a_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_a", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_a_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_a_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_a_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_a_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_a_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_a_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_a_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_a_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_a", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_gmem_a_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_a", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_a_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_a_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_a_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_a_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_a_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_a_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_a_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_a", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_a_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_a_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_a", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_b_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_b_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_b_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_b_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_b_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_b", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_gmem_b_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_b", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_b_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_b", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_b_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_b_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_b_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_b_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_b_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_b_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_b_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_b_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_b", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_gmem_b_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_b", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_b_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_b_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_b_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_b_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_b_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_b_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_b_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_b", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_b_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_b_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_b", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_c_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_c_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_c_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_c_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_c_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_c", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_gmem_c_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_c", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_c_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_c", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_c_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_c_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_c_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_c_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_c_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_c_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_c_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_c_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_c", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_gmem_c_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_c", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_c_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_c_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_c_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_c_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_c_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_c_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_c_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_c", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_c_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_c_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_c", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "8", "9", "11", "13", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51"],
		"CDFG" : "matrix_multiply_32x32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1075", "EstimateLatencyMax" : "1075",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "5", "Name" : "entry_proc_U0"},
			{"ID" : "6", "Name" : "Loop_VITIS_LOOP_47_1_proc2_U0"},
			{"ID" : "8", "Name" : "Block_VITIS_LOOP_57_3_proc_U0"},
			{"ID" : "9", "Name" : "Loop_VITIS_LOOP_57_3_proc_U0"}],
		"OutputProcess" : [
			{"ID" : "13", "Name" : "Loop_VITIS_LOOP_70_5_proc3_U0"}],
		"Port" : [
			{"Name" : "gmem_a", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "Loop_VITIS_LOOP_47_1_proc2_U0", "Port" : "gmem_a"}]},
			{"Name" : "gmem_b", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_57_3_proc_U0", "Port" : "gmem_b"}]},
			{"Name" : "gmem_c", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "Loop_VITIS_LOOP_70_5_proc3_U0", "Port" : "gmem_c"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "None", "Direction" : "I"},
			{"Name" : "C", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_a_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_b_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_c_m_axi_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.entry_proc_U0", "Parent" : "0",
		"CDFG" : "entry_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "C", "Type" : "None", "Direction" : "I"},
			{"Name" : "C_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "15", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "C_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_47_1_proc2_U0", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "Loop_VITIS_LOOP_47_1_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
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
			{"Name" : "gmem_a", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_a_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_a_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11","12"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "a_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage9", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage9_subdone", "QuitState" : "ap_ST_fsm_pp0_stage9", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage9_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_47_1_proc2_U0.flow_control_loop_pipe_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_VITIS_LOOP_57_3_proc_U0", "Parent" : "0",
		"CDFG" : "Block_VITIS_LOOP_57_3_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "B", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_57_3_proc_U0", "Parent" : "0", "Child" : ["10"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "19", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "20", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "21", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "22", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "23", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "25", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "26", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "27", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "30", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "31", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "32", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "33", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "34", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "35", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "36", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "37", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "38", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "39", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "40", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "41", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "42", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "43", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "44", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "45", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "46", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "47", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "b_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11","12"], "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "b_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_57_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage9", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage9_subdone", "QuitState" : "ap_ST_fsm_pp0_stage9", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage9_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_57_3_proc_U0.flow_control_loop_pipe_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int8_32x32_wrapper_wrapper_1_U0", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "int8_32x32_wrapper_wrapper_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33", "EstimateLatencyMax" : "33",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"StartSource" : "6",
		"StartFifo" : "start_for_int8_32x32_wrapper_wrapper_1_U0_U",
		"InputProcess" : [
			{"ID" : "12", "Name" : "int8_32x32_wrapper_U0"}],
		"OutputProcess" : [
			{"ID" : "12", "Name" : "int8_32x32_wrapper_U0"}],
		"Port" : [
			{"Name" : "a_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int8_32x32_wrapper_U0", "Port" : "a_stream"}]},
			{"Name" : "b_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["9"], "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int8_32x32_wrapper_U0", "Port" : "b_stream"}]},
			{"Name" : "c_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int8_32x32_wrapper_U0", "Port" : "c_stream"}]}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int8_32x32_wrapper_wrapper_1_U0.int8_32x32_wrapper_U0", "Parent" : "11",
		"CDFG" : "int8_32x32_wrapper",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Unaligned", "UnalignedPipeline" : "1", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "33", "EstimateLatencyMin" : "33", "EstimateLatencyMax" : "33",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "1",
		"ControlMap" : {"ap_start" : "ap_start", "ap_ready" : "ap_ready", "ap_done" : "ap_done", "ap_continue" : "ap_continue"},
		"Port" : [
			{"Name" : "a_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0"},
			{"Name" : "b_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["9"], "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "0"},
			{"Name" : "c_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "0"}]},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_70_5_proc3_U0", "Parent" : "0", "Child" : ["14"],
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
		"StartSource" : "5",
		"StartFifo" : "start_for_Loop_VITIS_LOOP_70_5_proc3_U0_U",
		"Port" : [
			{"Name" : "C", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "15", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "C_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem_c", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_c_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_c_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_c_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "c_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["11","12"], "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "c_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_70_5_VITIS_LOOP_72_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_70_5_proc3_U0.flow_control_loop_pipe_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.C_c_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_stream_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc_channel_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc36_channel_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc37_channel_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc38_channel_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc39_channel_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc40_channel_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc41_channel_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc42_channel_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc43_channel_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc44_channel_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc45_channel_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc46_channel_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc47_channel_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc48_channel_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc49_channel_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc50_channel_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc51_channel_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc52_channel_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc53_channel_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc54_channel_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc55_channel_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc56_channel_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc57_channel_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc58_channel_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc59_channel_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc60_channel_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc61_channel_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc62_channel_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc63_channel_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc64_channel_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc65_channel_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_stream_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_stream_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VITIS_LOOP_70_5_proc3_U0_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_int8_32x32_wrapper_wrapper_1_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matrix_multiply_32x32 {
		gmem_a {Type I LastRead 40 FirstWrite -1}
		gmem_b {Type I LastRead 40 FirstWrite -1}
		gmem_c {Type O LastRead 4 FirstWrite 3}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		C {Type I LastRead 0 FirstWrite -1}}
	entry_proc {
		C {Type I LastRead 0 FirstWrite -1}
		C_c {Type O LastRead -1 FirstWrite 0}}
	Loop_VITIS_LOOP_47_1_proc2 {
		gmem_a {Type I LastRead 40 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		a_stream {Type O LastRead -1 FirstWrite 41}}
	Block_VITIS_LOOP_57_3_proc {
		B {Type I LastRead 0 FirstWrite -1}}
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
		b_stream {Type O LastRead -1 FirstWrite 41}}
	int8_32x32_wrapper_wrapper_1 {
		a_stream {Type I LastRead -1 FirstWrite -1}
		b_stream {Type I LastRead -1 FirstWrite -1}
		c_stream {Type O LastRead -1 FirstWrite -1}}
	int8_32x32_wrapper {
		a_stream {Type I LastRead -1 FirstWrite -1}
		b_stream {Type I LastRead -1 FirstWrite -1}
		c_stream {Type O LastRead -1 FirstWrite -1}}
	Loop_VITIS_LOOP_70_5_proc3 {
		C {Type I LastRead 1 FirstWrite -1}
		gmem_c {Type O LastRead 4 FirstWrite 3}
		c_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1075", "Max" : "1075"}
	, {"Name" : "Interval", "Min" : "1024", "Max" : "1024"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem_a { m_axi {  { m_axi_gmem_a_AWVALID VALID 1 1 }  { m_axi_gmem_a_AWREADY READY 0 1 }  { m_axi_gmem_a_AWADDR ADDR 1 64 }  { m_axi_gmem_a_AWID ID 1 1 }  { m_axi_gmem_a_AWLEN SIZE 1 8 }  { m_axi_gmem_a_AWSIZE BURST 1 3 }  { m_axi_gmem_a_AWBURST LOCK 1 2 }  { m_axi_gmem_a_AWLOCK CACHE 1 2 }  { m_axi_gmem_a_AWCACHE PROT 1 4 }  { m_axi_gmem_a_AWPROT QOS 1 3 }  { m_axi_gmem_a_AWQOS REGION 1 4 }  { m_axi_gmem_a_AWREGION USER 1 4 }  { m_axi_gmem_a_AWUSER DATA 1 1 }  { m_axi_gmem_a_WVALID VALID 1 1 }  { m_axi_gmem_a_WREADY READY 0 1 }  { m_axi_gmem_a_WDATA FIFONUM 1 32 }  { m_axi_gmem_a_WSTRB STRB 1 4 }  { m_axi_gmem_a_WLAST LAST 1 1 }  { m_axi_gmem_a_WID ID 1 1 }  { m_axi_gmem_a_WUSER DATA 1 1 }  { m_axi_gmem_a_ARVALID VALID 1 1 }  { m_axi_gmem_a_ARREADY READY 0 1 }  { m_axi_gmem_a_ARADDR ADDR 1 64 }  { m_axi_gmem_a_ARID ID 1 1 }  { m_axi_gmem_a_ARLEN SIZE 1 8 }  { m_axi_gmem_a_ARSIZE BURST 1 3 }  { m_axi_gmem_a_ARBURST LOCK 1 2 }  { m_axi_gmem_a_ARLOCK CACHE 1 2 }  { m_axi_gmem_a_ARCACHE PROT 1 4 }  { m_axi_gmem_a_ARPROT QOS 1 3 }  { m_axi_gmem_a_ARQOS REGION 1 4 }  { m_axi_gmem_a_ARREGION USER 1 4 }  { m_axi_gmem_a_ARUSER DATA 1 1 }  { m_axi_gmem_a_RVALID VALID 0 1 }  { m_axi_gmem_a_RREADY READY 1 1 }  { m_axi_gmem_a_RDATA FIFONUM 0 32 }  { m_axi_gmem_a_RLAST LAST 0 1 }  { m_axi_gmem_a_RID ID 0 1 }  { m_axi_gmem_a_RUSER DATA 0 1 }  { m_axi_gmem_a_RRESP RESP 0 2 }  { m_axi_gmem_a_BVALID VALID 0 1 }  { m_axi_gmem_a_BREADY READY 1 1 }  { m_axi_gmem_a_BRESP RESP 0 2 }  { m_axi_gmem_a_BID ID 0 1 }  { m_axi_gmem_a_BUSER DATA 0 1 } } }
	gmem_b { m_axi {  { m_axi_gmem_b_AWVALID VALID 1 1 }  { m_axi_gmem_b_AWREADY READY 0 1 }  { m_axi_gmem_b_AWADDR ADDR 1 64 }  { m_axi_gmem_b_AWID ID 1 1 }  { m_axi_gmem_b_AWLEN SIZE 1 8 }  { m_axi_gmem_b_AWSIZE BURST 1 3 }  { m_axi_gmem_b_AWBURST LOCK 1 2 }  { m_axi_gmem_b_AWLOCK CACHE 1 2 }  { m_axi_gmem_b_AWCACHE PROT 1 4 }  { m_axi_gmem_b_AWPROT QOS 1 3 }  { m_axi_gmem_b_AWQOS REGION 1 4 }  { m_axi_gmem_b_AWREGION USER 1 4 }  { m_axi_gmem_b_AWUSER DATA 1 1 }  { m_axi_gmem_b_WVALID VALID 1 1 }  { m_axi_gmem_b_WREADY READY 0 1 }  { m_axi_gmem_b_WDATA FIFONUM 1 32 }  { m_axi_gmem_b_WSTRB STRB 1 4 }  { m_axi_gmem_b_WLAST LAST 1 1 }  { m_axi_gmem_b_WID ID 1 1 }  { m_axi_gmem_b_WUSER DATA 1 1 }  { m_axi_gmem_b_ARVALID VALID 1 1 }  { m_axi_gmem_b_ARREADY READY 0 1 }  { m_axi_gmem_b_ARADDR ADDR 1 64 }  { m_axi_gmem_b_ARID ID 1 1 }  { m_axi_gmem_b_ARLEN SIZE 1 8 }  { m_axi_gmem_b_ARSIZE BURST 1 3 }  { m_axi_gmem_b_ARBURST LOCK 1 2 }  { m_axi_gmem_b_ARLOCK CACHE 1 2 }  { m_axi_gmem_b_ARCACHE PROT 1 4 }  { m_axi_gmem_b_ARPROT QOS 1 3 }  { m_axi_gmem_b_ARQOS REGION 1 4 }  { m_axi_gmem_b_ARREGION USER 1 4 }  { m_axi_gmem_b_ARUSER DATA 1 1 }  { m_axi_gmem_b_RVALID VALID 0 1 }  { m_axi_gmem_b_RREADY READY 1 1 }  { m_axi_gmem_b_RDATA FIFONUM 0 32 }  { m_axi_gmem_b_RLAST LAST 0 1 }  { m_axi_gmem_b_RID ID 0 1 }  { m_axi_gmem_b_RUSER DATA 0 1 }  { m_axi_gmem_b_RRESP RESP 0 2 }  { m_axi_gmem_b_BVALID VALID 0 1 }  { m_axi_gmem_b_BREADY READY 1 1 }  { m_axi_gmem_b_BRESP RESP 0 2 }  { m_axi_gmem_b_BID ID 0 1 }  { m_axi_gmem_b_BUSER DATA 0 1 } } }
	gmem_c { m_axi {  { m_axi_gmem_c_AWVALID VALID 1 1 }  { m_axi_gmem_c_AWREADY READY 0 1 }  { m_axi_gmem_c_AWADDR ADDR 1 64 }  { m_axi_gmem_c_AWID ID 1 1 }  { m_axi_gmem_c_AWLEN SIZE 1 8 }  { m_axi_gmem_c_AWSIZE BURST 1 3 }  { m_axi_gmem_c_AWBURST LOCK 1 2 }  { m_axi_gmem_c_AWLOCK CACHE 1 2 }  { m_axi_gmem_c_AWCACHE PROT 1 4 }  { m_axi_gmem_c_AWPROT QOS 1 3 }  { m_axi_gmem_c_AWQOS REGION 1 4 }  { m_axi_gmem_c_AWREGION USER 1 4 }  { m_axi_gmem_c_AWUSER DATA 1 1 }  { m_axi_gmem_c_WVALID VALID 1 1 }  { m_axi_gmem_c_WREADY READY 0 1 }  { m_axi_gmem_c_WDATA FIFONUM 1 32 }  { m_axi_gmem_c_WSTRB STRB 1 4 }  { m_axi_gmem_c_WLAST LAST 1 1 }  { m_axi_gmem_c_WID ID 1 1 }  { m_axi_gmem_c_WUSER DATA 1 1 }  { m_axi_gmem_c_ARVALID VALID 1 1 }  { m_axi_gmem_c_ARREADY READY 0 1 }  { m_axi_gmem_c_ARADDR ADDR 1 64 }  { m_axi_gmem_c_ARID ID 1 1 }  { m_axi_gmem_c_ARLEN SIZE 1 8 }  { m_axi_gmem_c_ARSIZE BURST 1 3 }  { m_axi_gmem_c_ARBURST LOCK 1 2 }  { m_axi_gmem_c_ARLOCK CACHE 1 2 }  { m_axi_gmem_c_ARCACHE PROT 1 4 }  { m_axi_gmem_c_ARPROT QOS 1 3 }  { m_axi_gmem_c_ARQOS REGION 1 4 }  { m_axi_gmem_c_ARREGION USER 1 4 }  { m_axi_gmem_c_ARUSER DATA 1 1 }  { m_axi_gmem_c_RVALID VALID 0 1 }  { m_axi_gmem_c_RREADY READY 1 1 }  { m_axi_gmem_c_RDATA FIFONUM 0 32 }  { m_axi_gmem_c_RLAST LAST 0 1 }  { m_axi_gmem_c_RID ID 0 1 }  { m_axi_gmem_c_RUSER DATA 0 1 }  { m_axi_gmem_c_RRESP RESP 0 2 }  { m_axi_gmem_c_BVALID VALID 0 1 }  { m_axi_gmem_c_BREADY READY 1 1 }  { m_axi_gmem_c_BRESP RESP 0 2 }  { m_axi_gmem_c_BID ID 0 1 }  { m_axi_gmem_c_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict gmem_a { CHANNEL_NUM 0 BUNDLE gmem_a NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_b { CHANNEL_NUM 0 BUNDLE gmem_b NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_c { CHANNEL_NUM 0 BUNDLE gmem_c NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem_a 1 }
	{ gmem_b 1 }
	{ gmem_c 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem_a 1 }
	{ gmem_b 1 }
	{ gmem_c 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
