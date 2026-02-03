/*
 * matrix_multiply_32x32.h
 * Header file for int8_32x32 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_32X32_H
#define MATRIX_MULTIPLY_32X32_H

#include "ap_int.h"

// Top-level HLS function for 32x32 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_32x32(
    ap_int<8> A[32][32],
    ap_int<8> B[32][32],
    ap_int<16> C[32][32]
);

#endif
