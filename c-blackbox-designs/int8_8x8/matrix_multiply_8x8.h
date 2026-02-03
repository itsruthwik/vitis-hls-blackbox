/*
 * matrix_multiply_8x8.h
 * Header file for int8_8x8 matrix multiplication using blackbox wrapper
 */

#ifndef MATRIX_MULTIPLY_8X8_H
#define MATRIX_MULTIPLY_8X8_H

#include "ap_int.h"
#include "hls_stream.h"

// Forward declaration of the blackbox RTL wrapper
void int8_8x8_wrapper(
    hls::stream<ap_uint<64>>& a_stream,
    hls::stream<ap_uint<64>>& b_stream,
    hls::stream<ap_uint<128>>& c_stream
);

// Top-level HLS function for 8x8 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_8x8(
    ap_int<8> A[8][8],
    ap_int<8> B[8][8],
    ap_int<16> C[8][8]
);

#endif
