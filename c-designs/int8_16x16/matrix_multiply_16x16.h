#ifndef MATRIX_MULTIPLY_16X16_H
#define MATRIX_MULTIPLY_16X16_H

#include "hls_stream.h"
#include "ap_int.h"

// Forward declaration of the blackbox RTL wrapper
void int8_16x16_wrapper(
    hls::stream<ap_uint<128>>& a_stream,
    hls::stream<ap_uint<128>>& b_stream,
    hls::stream<ap_uint<256>>& c_stream
);

// Top-level HLS function for 16x16 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_16x16(
    ap_int<8> A[16][16],
    ap_int<8> B[16][16],
    ap_int<16> C[16][16]
);

#endif
