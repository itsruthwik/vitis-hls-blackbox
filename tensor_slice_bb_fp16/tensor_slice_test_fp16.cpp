/*
 * tensor_slice_test_fp16.cpp
 * Top-level HLS function that uses the tensor_slice_wrapper_fp16 blackbox
 */

#include "tensor_slice_test_fp16.h"

//--------------------------------------------------------
// Forward declaration of the blackbox RTL function
void tensor_slice_wrapper_fp16(
    matrix_data_t a_data,
    matrix_data_t b_data,
    result_data_t& c_data_out
);

//--------------------------------------------------------
// Top-level function - this is what gets synthesized
result_data_t tensor_slice_test_fp16(
    matrix_data_t a_data,
    matrix_data_t b_data
) {
    result_data_t c_data_out;
    // Call the blackbox RTL module
    tensor_slice_wrapper_fp16(a_data, b_data, c_data_out);
    return c_data_out;
    
    // Could add pre-processing before the call or 
    // post-processing after the call here if needed
}
