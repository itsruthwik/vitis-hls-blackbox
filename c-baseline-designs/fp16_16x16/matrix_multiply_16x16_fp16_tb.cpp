/*
 * matrix_multiply_16x16_fp16_tb.cpp
 * Testbench for full 16x16 matrix multiplication using ap_fixed<16,6> precision
 */

#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include "matrix_multiply_16x16_fp16.h"

using namespace std;

int main() {
    int retval = 0;
    ofstream result_file;
    
    // Allocate matrices (using ap_fixed types from header)
    ap_fixed<16,6> A[16][16];
    ap_fixed<16,6> B[16][16];
    ap_fixed<40,16> C[16][16];
    
    printf("Starting full 16x16 matrix multiplication tests (ap_fixed<16,6>)...\n");
    
    // Open result file for writing
    result_file.open("result.dat");
    if (!result_file.is_open()) {
        printf("ERROR: Could not open result.dat for writing\n");
        return 1;
    }
    
    // Test 1: Zero matrix × incrementing matrix
    printf("\nTest 1: Zero matrix × incrementing matrix\n");
    
    // Initialize A with all zeros, B with rows [1, 2, 3, ..., 16]
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            A[i][j] = 0.0;
            B[i][j] = (j + 1);  // Each row is [1, 2, 3, ..., 16]
            C[i][j] = 0.0;
        }
    }
    
    // Run the computation
    matrix_multiply_16x16_fp16(A, B, C);
    
    // Expected result: all zeros (0 × anything = 0)
    printf("Result:\n");
    for (int i = 0; i < 16; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 16; j++) {
            double c_val = C[i][j].to_double();
            printf(" %6.2f", c_val);
            result_file << c_val << " ";
            if (c_val != 0.0) {
                printf(" (ERROR: expected 0.0)");
                retval = 1;
            }
        }
        printf("\n");
        result_file << endl;
    }
    
    // Test 2: Matrix of 2s × incrementing matrix
    printf("\nTest 2: Matrix of 2s × incrementing matrix\n");
    
    // Initialize A with all 2s, B with rows [0.333, 0.666, ..., 5.328]
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            A[i][j] = 2.0;
            B[i][j] = (j + 1) * 0.333;  // Each row is [0.333, 0.666, ..., 5.328]
            C[i][j] = 0.0;
        }
    }
    
    // Run the computation
    matrix_multiply_16x16_fp16(A, B, C);
    
    // Expected result: C[i][j] = 2 × 16 × (j+1) = 32 × (j+1)
    // C = [32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 480, 512] for each row
    printf("Result:\n");
    for (int i = 0; i < 16; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 16; j++) {
            double c_val = C[i][j].to_double();
            double expected = 32.0 * (j + 1) * 0.333;
            printf(" %6.2f", c_val);
            result_file << c_val << " ";

	    // Using tolerance based error checking because of floating point quantization errors
            double tolerance = 0.07;  // Adjust based on precision needs
            if (fabs(c_val - expected) > tolerance) {
                printf(" (ERROR: expected %.2f, diff=%.3f)", expected, fabs(c_val - expected));
                retval = 1;
            }
        }
        printf("\n");
        result_file << endl;
    }
    
    result_file.close();
    
    // Compare with golden results if file exists
    printf("\nChecking for golden results file...\n");
    ifstream golden_check("result.golden.dat");
    if (golden_check.good()) {
        golden_check.close();
        printf("Golden file found, comparing...\n");
        int diff_result = system("diff --brief -w result.dat result.golden.dat");
        if (diff_result != 0) {
            printf("Result differs from golden file!\n");
            retval = 1;
        }
    } else {
        printf("No golden file found, skipping comparison.\n");
    }
    
    if (retval == 0) {
        printf("\nTest passed !\n");
    } else {
        printf("\nTest FAILED !\n");
    }
    
    return retval;
}
