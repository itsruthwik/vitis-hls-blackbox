#include "ap_int.h"
#include "ap_fixed.h"
#include "tensor_slice_test_fp16.h"

// Behavioral model for tensor_slice_wrapper_fp16
// This runs during C simulation only - RTL cosim uses the actual Verilog
void tensor_slice_wrapper_fp16(
    ap_uint<128> a_data,
    ap_uint<128> b_data,
    ap_uint<256>& c_data_out
) {
#pragma HLS inline off

    // Extract 16-bit fixed-point values from packed inputs
    fp16_t a_vals[8];
    fp16_t b_vals[8];
    fp16_t c_vals[8];

    // Unpack inputs (16 bits per value)
    for(int i = 0; i < 8; i++) {
        // Extract 16-bit slice and reinterpret as fixed-point
        ap_uint<16> a_bits = a_data.range(i*16+15, i*16);
        ap_uint<16> b_bits = b_data.range(i*16+15, i*16);
        
        // Reinterpret raw bits as ap_fixed
        a_vals[i].range(15, 0) = a_bits;
        b_vals[i].range(15, 0) = b_bits;
    }

    // Perform element-wise fixed-point multiply
    for(int i = 0; i < 8; i++) {
        c_vals[i] = a_vals[i] * b_vals[i];  // Real fixed-point multiply!
    }

    // Pack results into output (lower 128 bits: multiplication results)
    c_data_out = 0;
    for(int i = 0; i < 8; i++) {
        ap_uint<16> result_bits = c_vals[i].range(15, 0);
        c_data_out.range(i*16+15, i*16) = result_bits;
    }
    
    // Upper 128 bits: pass through a_data (to keep 256-bit output width)
    c_data_out.range(255, 128) = a_data;

}
