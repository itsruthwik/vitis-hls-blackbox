/*
 * matrix_multiply_16x16_fp16.h
 * Header file for ap_fixed<16,6> 16x16 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_16X16_FP16_H
#define MATRIX_MULTIPLY_16X16_FP16_H

#include "ap_fixed.h"

// Top-level HLS function for 16x16 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_16x16_fp16(
    ap_fixed<16,6> A[16][16],
    ap_fixed<16,6> B[16][16],
    ap_fixed<40,16> C[16][16]
);

#endif
