
set Spec2ImplPortList { 
	a_stream { ap_fifo {  { a_stream_dout fifo_data_in 0 128 }  { a_stream_empty_n fifo_status 0 1 }  { a_stream_read fifo_port_we 1 1 } } }
	b_stream { ap_fifo {  { b_stream_dout fifo_data_in 0 128 }  { b_stream_empty_n fifo_status 0 1 }  { b_stream_read fifo_port_we 1 1 } } }
	c_stream { ap_fifo {  { c_stream_din fifo_data_in 1 256 }  { c_stream_full_n fifo_status 0 1 }  { c_stream_write fifo_port_we 1 1 } } }
}
