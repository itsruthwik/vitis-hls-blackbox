#include "ap_int.h"

void tensor_slice_wrapper(
    int& ap_idle,
    int& ap_ready,
    int& ap_done,
    int& ap_continue,
    ap_uint<64>& a_data,
    ap_uint<64>& b_data,
    ap_uint<128>& c_data_out,
    int& c_data_available_port
) {
    // Dummy implementation for blackbox
    c_data_out = (ap_uint<128>)a_data + (ap_uint<128>)b_data;
    c_data_available_port = 1;
    ap_done = 1;
    ap_ready = 1;
    ap_idle = 0;
}