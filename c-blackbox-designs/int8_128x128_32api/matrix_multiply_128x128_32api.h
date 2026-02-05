/*
 * matrix_multiply_128x128_32api.h
 * Header file for 128x128 matrix multiplication using 32x32 wrapper tiles
 */

#ifndef MATRIX_MULTIPLY_128X128_32API_H
#define MATRIX_MULTIPLY_128X128_32API_H

#include "ap_int.h"
#include "hls_stream.h"

// Forward declaration of 32x32 blackbox wrapper
void int8_32x32_wrapper(
    hls::stream<ap_uint<256>>& a_stream,
    hls::stream<ap_uint<256>>& b_stream,
    hls::stream<ap_uint<512>>& c_stream
);

// Top-level function that will be synthesized
void matrix_multiply_128x128_32api(
    ap_int<8> A[128][128],
    ap_int<8> B[128][128],
    ap_int<16> C[128][128]
);

#endif
