/*
 * matrix_multiply_128x128.h
 * Header file for 128x128 matrix multiplication using 2x2 tiling of 64x64 blocks
 */

#ifndef MATRIX_MULTIPLY_128X128_H
#define MATRIX_MULTIPLY_128X128_H

#include "ap_int.h"
#include "../int8_64x64/matrix_multiply_64x64.h"

// Top-level function that will be synthesized
// Uses 64x64 kernel for computation
void matrix_multiply_128x128(
    ap_int<8> A[128][128],
    ap_int<8> B[128][128],
    ap_int<16> C[128][128]
);

#endif
