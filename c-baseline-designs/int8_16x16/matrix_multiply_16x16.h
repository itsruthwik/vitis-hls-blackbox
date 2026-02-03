/*
 * matrix_multiply_16x16.h
 * Header file for int8_16x16 matrix multiplication behavioral implementation
 */

#ifndef MATRIX_MULTIPLY_16X16_H
#define MATRIX_MULTIPLY_16X16_H

#include "ap_int.h"

// Top-level HLS function for 16x16 matrix multiplication
// Uses memory-mapped AXI interface for matrices
void matrix_multiply_16x16(
    ap_int<8> A[16][16],
    ap_int<8> B[16][16],
    ap_int<16> C[16][16]
);

#endif
