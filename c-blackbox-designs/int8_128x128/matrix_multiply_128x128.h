/*
 * matrix_multiply_128x128.h
 * Header file for 128x128 matrix multiplication using int8_128x128_wrapper blackbox
 */

#ifndef MATRIX_MULTIPLY_128X128_H
#define MATRIX_MULTIPLY_128X128_H

#include "ap_int.h"
#include "hls_stream.h"

// Top-level function that will be synthesized
// Uses int8_128x128_wrapper blackbox for computation
void matrix_multiply_128x128(
    ap_int<8> A[128][128],
    ap_int<8> B[128][128],
    ap_int<16> C[128][128]
);

#endif
