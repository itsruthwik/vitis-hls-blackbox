/*
 * matrix_multiply_8x8_fp16.h
 * Header file for ap_fixed<16,6> 8x8 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_8X8_FP16_H
#define MATRIX_MULTIPLY_8X8_FP16_H

#include "ap_fixed.h"

// Top-level HLS function for 8x8 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_8x8_fp16(
    ap_fixed<16,6> A[8][8],
    ap_fixed<16,6> B[8][8],
    ap_fixed<40,16> C[8][8]
);

#endif
