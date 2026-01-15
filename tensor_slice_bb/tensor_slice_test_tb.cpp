/*
 * tensor_slice_test_tb.cpp
 * Simple testbench for tensor_slice_wrapper blackbox
 */

#include <stdlib.h>
#include "tensor_slice_test.h"

int main() {
    result_data_t c_result;
    int retval = 0;
    ofstream FILE;

    cout << "Starting tensor_slice_wrapper tests..." << endl;

    // Save the results to a file
    FILE.open("result.dat");

    // Test 1: Simple values - all 1s * all 2s
    matrix_data_t a1 = 0x0101010101010101; // 8 bytes of 0x01
    matrix_data_t b1 = 0x0202020202020202; // 8 bytes of 0x02
    c_result = tensor_slice_test(a1, b1);
    cout << "Test 1: a=all_1s, b=all_2s, result=" << hex << c_result << dec << endl;
    FILE << c_result << endl;

    // Test 2: All zeros
    matrix_data_t a2 = 0x0;
    matrix_data_t b2 = 0x0;
    c_result = tensor_slice_test(a2, b2);
    cout << "Test 2: a=all_0s, b=all_0s, result=" << hex << c_result << dec << endl;
    FILE << c_result << endl;

    // Test 3: Simple incrementing values
    matrix_data_t a3 = 0x0807060504030201; // [1,2,3,4,5,6,7,8]
    matrix_data_t b3 = 0x0101010101010101; // [1,1,1,1,1,1,1,1]
    c_result =  tensor_slice_test(a3, b3);
    cout << "Test 3: a=incrementing, b=all_1s, result=" << hex << c_result << dec << endl;
    FILE << c_result << endl;

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
