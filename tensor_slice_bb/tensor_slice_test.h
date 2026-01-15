/*
 * tensor_slice_test.h
 * Header file for tensor_slice blackbox integration
 */

#ifndef _TENSOR_SLICE_TEST_H_
#define _TENSOR_SLICE_TEST_H_

#include <fstream>
#include <iostream>
using namespace std;

#include "ap_int.h"

// Data types matching the tensor_slice_wrapper interface
typedef ap_uint<64> matrix_data_t;   // 8 x 8-bit values
typedef ap_uint<128> result_data_t;  // 8 x 16-bit results

// Top-level function that will be synthesized
// This function uses the tensor_slice_wrapper blackbox
result_data_t tensor_slice_test(
    matrix_data_t a_data,
    matrix_data_t b_data
);

#endif
