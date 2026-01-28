#ifndef MATRIX_MULTIPLY_32X32_H
#define MATRIX_MULTIPLY_32X32_H

#include "hls_stream.h"
#include "ap_int.h"

// Forward declaration of the blackbox RTL wrapper
void int8_32x32_wrapper(
    hls::stream<ap_uint<256>>& a_stream,
    hls::stream<ap_uint<256>>& b_stream,
    hls::stream<ap_uint<512>>& c_stream
);

// Top-level HLS function for 32x32 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_32x32(
    ap_int<8> A[32][32],
    ap_int<8> B[32][32],
    ap_int<16> C[32][32]
);

#endif
