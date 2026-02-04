#ifndef MATRIX_MULTIPLY_64X64_H
#define MATRIX_MULTIPLY_64X64_H

#include "ap_int.h"
#include "../int8_32x32/matrix_multiply_32x32.h"  // Import 32x32 module

void matrix_multiply_64x64(
    ap_int<8> A[64][64],
    ap_int<8> B[64][64],
    ap_int<16> C[64][64]
);

#endif
