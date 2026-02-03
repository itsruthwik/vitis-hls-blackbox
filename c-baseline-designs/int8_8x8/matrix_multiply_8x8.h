/*
 * matrix_multiply_8x8.h
 * Header file for int8_8x8 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_8X8_H
#define MATRIX_MULTIPLY_8X8_H

#include "ap_int.h"

// Top-level HLS function for 8x8 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_8x8(
    ap_int<8> A[8][8],
    ap_int<8> B[8][8],
    ap_int<16> C[8][8]
);

#endif
