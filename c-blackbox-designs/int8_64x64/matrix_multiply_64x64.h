/*
 * matrix_multiply_64x64.h
 * Header file for 64x64 matrix multiplication using int8_64x64_wrapper blackbox
 */

#ifndef MATRIX_MULTIPLY_64X64_H
#define MATRIX_MULTIPLY_64X64_H

#include "ap_int.h"
#include "hls_stream.h"

// Top-level function that will be synthesized
// Uses int8_64x64_wrapper blackbox for computation
void matrix_multiply_64x64(
    ap_int<8> A[64][64],
    ap_int<8> B[64][64],
    ap_int<16> C[64][64]
);

#endif
