/*
 * tensor_slice_test_fp16_tb.cpp
 * Simple testbench for tensor_slice_wrapper_fp16 blackbox with ap_fixed
 */

#include <stdlib.h>
#include "tensor_slice_test_fp16.h"

// Helper function to pack fp16_t values into ap_uint<128>
ap_uint<128> pack_fp16_array(fp16_t vals[8]) {
    ap_uint<128> packed = 0;
    for(int i = 0; i < 8; i++) {
        ap_uint<16> bits = vals[i].range(15, 0);
        packed.range(i*16+15, i*16) = bits;
    }
    return packed;
}

int main() {
    result_data_t c_result;
    int retval = 0;
    ofstream FILE;

    cout << "Starting tensor_slice_wrapper_fp16 tests with ap_fixed..." << endl;

    // Save the results to a file
    FILE.open("result.dat");

    // Test 1: Simple multiplication - 1.5 * 2.0 = 3.0
    fp16_t a1_array[8] = {1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5};
    fp16_t b1_array[8] = {2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0};
    matrix_data_t a1 = pack_fp16_array(a1_array);
    matrix_data_t b1 = pack_fp16_array(b1_array);
    c_result = tensor_slice_test_fp16(a1, b1);
    cout << "Test 1: a=1.5, b=2.0, result=" << hex << c_result << dec << endl;
    FILE << c_result.to_string(16) << endl;

    // Test 2: All zeros
    fp16_t a2_array[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    fp16_t b2_array[8] = {0, 0, 0, 0, 0, 0, 0, 0};
    matrix_data_t a2 = pack_fp16_array(a2_array);
    matrix_data_t b2 = pack_fp16_array(b2_array);
    c_result = tensor_slice_test_fp16(a2, b2);
    cout << "Test 2: a=0, b=0, result=" << hex << c_result << dec << endl;
    FILE << c_result.to_string(16) << endl;

    // Test 3: Incrementing values - [1.0, 2.0, ...] * 0.5 = [0.5, 1.0, ...]
    fp16_t a3_array[8] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0};
    fp16_t b3_array[8] = {0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5};
    matrix_data_t a3 = pack_fp16_array(a3_array);
    matrix_data_t b3 = pack_fp16_array(b3_array);
    c_result = tensor_slice_test_fp16(a3, b3);
    cout << "Test 3: a=incrementing, b=0.5, result=" << hex << c_result << dec << endl;
    FILE << c_result.to_string(16) << endl;

    FILE.close();

    // Compare the results file with the golden results
    retval = system("diff --brief -w result.dat result.golden.dat");
    if (retval != 0) {
        cout << "Test failed  !!!" << endl;
        retval = 1;
    } else {
        cout << "Test passed !" << endl;
    }

    return retval;
}
