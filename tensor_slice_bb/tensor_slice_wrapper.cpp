#include "ap_int.h"
#include "tensor_slice_test.h"

// Behavioral model for tensor_slice_wrapper
// This runs during C simulation only - RTL cosim uses the actual Verilog
void tensor_slice_wrapper(
    ap_uint<64> a_data,
    ap_uint<64> b_data,
    ap_uint<128>& c_data_out
) {
#pragma HLS inline off

    c_data_out = 0;

    // Extract 8-bit signed values from inputs
    ap_int<8> a_vals[8];
    ap_int<8> b_vals[8];
    ap_int<16> c_vals[8];

    for(int i = 0; i < 8; i++) {
        a_vals[i] = a_data.range(i*8+7, i*8);
        b_vals[i] = b_data.range(i*8+7, i*8);
    }

    // Perform element-wise multiply-accumulate
    for(int i = 0; i < 8; i++) {
        c_vals[i] = a_vals[i] * b_vals[i];
    }

    // Pack results into output
    for(int i = 0; i < 8; i++) {
        c_data_out.range(i*16+15, i*16) = c_vals[i];
    }

}
