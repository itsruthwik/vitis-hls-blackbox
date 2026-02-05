/*
 * matrix_multiply_32x32_fp16.h
 * Header file for ap_fixed<16,6> 32x32 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_32X32_FP16_H
#define MATRIX_MULTIPLY_32X32_FP16_H

#include "ap_fixed.h"

// Top-level HLS function for 32x32 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_32x32_fp16(
    ap_fixed<16,6> A[32][32],
    ap_fixed<16,6> B[32][32],
    ap_fixed<40,16> C[32][32]
);

#endif
