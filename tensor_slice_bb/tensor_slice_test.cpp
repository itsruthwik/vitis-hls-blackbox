/*
 * tensor_slice_test.cpp
 * Top-level HLS function that uses the tensor_slice_wrapper blackbox
 */

#include "tensor_slice_test.h"

//--------------------------------------------------------
// Forward declaration of the blackbox RTL function
void tensor_slice_wrapper(
    matrix_data_t a_data,
    matrix_data_t b_data,
    result_data_t& c_data_out
);

//--------------------------------------------------------
// Top-level function - this is what gets synthesized
result_data_t tensor_slice_test(
    matrix_data_t a_data,
    matrix_data_t b_data
) {
    result_data_t c_data_out;
    // Call the blackbox RTL module
    tensor_slice_wrapper(a_data, b_data, c_data_out);
    return c_data_out;
    
    // Could add pre-processing before the call or 
    // post-processing after the call here if needed
}
