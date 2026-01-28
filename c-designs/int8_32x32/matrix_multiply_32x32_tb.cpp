/*
 * matrix_multiply_32x32_tb.cpp
 * Testbench for full 32x32 matrix multiplication using int8_32x32_wrapper blackbox
 */

#include <stdlib.h>
#include <stdio.h>
#include "matrix_multiply_32x32.h"

int main() {
    int retval = 0;
    
    // Allocate matrices
    ap_int<8> A[32][32];
    ap_int<8> B[32][32];
    ap_int<16> C[32][32];
    
    // Test 1: All ones
    printf("Starting full 32x32 matrix multiplication tests...\n");
    printf("Test 1: 32x32 matrix multiplication with all ones result:\n");
    
    // Initialize matrices with 1s
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 32; j++) {
            A[i][j] = 1;
            B[i][j] = 1;
            C[i][j] = 0;
        }
    }
    
    // Run the computation
    matrix_multiply_32x32(A, B, C);
    
    // Expected result: each C[i][j] = 32 (sum of 32 ones)
    for (int i = 0; i < 32; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 32; j++) {
            printf(" 0x%04x", (unsigned short)C[i][j]);
            if (C[i][j] != 32) {
                printf(" (ERROR: expected 32)");
                retval = 1;
            }
        }
        printf("\n");
    }
    
    // Test 2: Zero matrix
    printf("\nTest 2: Zero matrix multiplication result:\n");
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 32; j++) {
            A[i][j] = 0;
            B[i][j] = 0;
            C[i][j] = 0;
        }
    }
    
    matrix_multiply_32x32(A, B, C);
    
    for (int i = 0; i < 32; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 32; j++) {
            printf(" 0x%04x", (unsigned short)C[i][j]);
            if (C[i][j] != 0) {
                printf(" (ERROR: expected 0)");
                retval = 1;
            }
        }
        printf("\n");
    }
    
    if (retval == 0) {
        printf("\nTest passed !\n");
    } else {
        printf("\nTest FAILED !\n");
    }
    
    return retval;
}
