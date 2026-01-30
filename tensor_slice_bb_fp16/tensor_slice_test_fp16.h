/*
 * tensor_slice_test_fp16.h
 * Header file for tensor_slice FP16 blackbox integration using ap_fixed
 */

#ifndef _TENSOR_SLICE_TEST_FP16_H_
#define _TENSOR_SLICE_TEST_FP16_H_

#include <fstream>
#include <iostream>
using namespace std;

#include "ap_int.h"
#include "ap_fixed.h"

// Define fixed-point type: 16 bits total, 6 integer bits (including sign)
// Range: [-32, +31.999...], Precision: ~0.001 (10 fractional bits)
typedef ap_fixed<16, 6> fp16_t;

// Data types for blackbox interface (packed bit vectors)
typedef ap_uint<128> matrix_data_t;   // 8 x 16-bit values packed
typedef ap_uint<256> result_data_t;   // Concatenated output (256-bit)

// Top-level function that will be synthesized
// This function uses the tensor_slice_wrapper_fp16 blackbox
result_data_t tensor_slice_test_fp16(
    matrix_data_t a_data,
    matrix_data_t b_data
);

#endif
