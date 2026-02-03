/*
 * matrix_multiply_8x8_tb.cpp
 * Testbench for full 8x8 matrix multiplication using int8_8x8_wrapper blackbox
 */

#include <stdlib.h>
#include <stdio.h>
#include "matrix_multiply_8x8.h"

int main() {
    int retval = 0;
    
    // Allocate matrices (using ap_int types from header)
    ap_int<8> A[8][8];
    ap_int<8> B[8][8];
    ap_int<16> C[8][8];
    
    // Test 1: All ones
    printf("Starting full 8x8 matrix multiplication tests...\n");
    printf("Test 1: 8x8 matrix multiplication with all ones result:\n");
    
    // Initialize matrices with 1s
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            A[i][j] = 1;
            B[i][j] = 1;
            C[i][j] = 0;
        }
    }
    
    // Run the computation
    matrix_multiply_8x8(A, B, C);
    
    // Expected result: each C[i][j] = 8 (sum of 8 ones)
    for (int i = 0; i < 8; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 8; j++) {
            printf(" 0x%04x", (unsigned short)C[i][j]);
            if (C[i][j] != 8) {
                printf(" (ERROR: expected 8)");
                retval = 1;
            }
        }
        printf("\n");
    }
    
    // Test 2: Zero matrix
    printf("\nTest 2: Zero matrix multiplication result:\n");
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            A[i][j] = 0;
            B[i][j] = 0;
            C[i][j] = 0;
        }
    }
    
    matrix_multiply_8x8(A, B, C);
    
    for (int i = 0; i < 8; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 8; j++) {
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
