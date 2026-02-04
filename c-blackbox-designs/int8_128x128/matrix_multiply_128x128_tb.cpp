/*
 * matrix_multiply_128x128_tb.cpp
 * Testbench for full 128x128 matrix multiplication using int8_128x128_wrapper blackbox
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "matrix_multiply_128x128.h"

int main() {
    int retval = 0;
    FILE *outfile, *goldenfile;
    
    // Allocate matrices
    ap_int<8> A[128][128];
    ap_int<8> B[128][128];
    ap_int<16> C[128][128];
    
    // Open output file
    outfile = fopen("result.dat", "w");
    if (!outfile) {
        printf("ERROR: Could not open result.dat for writing\n");
        return 1;
    }
    
    // Test 1: 0 x [1 2 3 ... 128]
    printf("Starting full 128x128 matrix multiplication tests...\n");
    printf("Test 1: 128x128 matrix multiplication with 0 x [1,2,3,...,128]\n");
    
    // Initialize matrices
    for (int i = 0; i < 128; i++) {
        for (int j = 0; j < 128; j++) {
            A[i][j] = 0;
            B[i][j] = j + 1;
            C[i][j] = 0;
        }
    }
    
    // Run the computation
    matrix_multiply_128x128(A, B, C);
    
    // Expected result: each C[i][j] = 0
    for (int i = 0; i < 128; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 128; j++) {
            printf(" 0x%04x", (unsigned short)C[i][j]);
            fprintf(outfile, "0x%04x\n", (unsigned short)C[i][j]);
            if (C[i][j] != 0) {
                printf(" (ERROR: expected 0x0000)");
                retval = 1;
            }
        }
        printf("\n");
    }
    
    // Test 2: 2 x [1 2 3 ... 128]
    printf("\nTest 2: 128x128 matrix multiplication with 2 x [1,2,3,...,128]\n");
    for (int i = 0; i < 128; i++) {
        for (int j = 0; j < 128; j++) {
            A[i][j] = 2;
            B[i][j] = j + 1;
            C[i][j] = 0;
        }
    }
    
    matrix_multiply_128x128(A, B, C);
    
    // Expected result: each C[i][j] = 256 * (j+1)
    for (int i = 0; i < 128; i++) {
        printf("Row %d:", i);
        for (int j = 0; j < 128; j++) {
            printf(" 0x%04x", (unsigned short)C[i][j]);
            fprintf(outfile, "0x%04x\n", (unsigned short)C[i][j]);
            int expected = 256 * (j + 1);
            if ((unsigned short)C[i][j] != (unsigned short)expected) {
                printf(" (ERROR: expected 0x%04x)", expected);
                retval = 1;
            }
        }
        printf("\n");
    }
    
    fclose(outfile);
    
    // Compare against golden reference if it exists
    goldenfile = fopen("result.golden.dat", "r");
    if (goldenfile) {
        printf("\nComparing against golden reference...\n");
        outfile = fopen("result.dat", "r");
        
        char result_line[32], golden_line[32];
        int line_num = 0;
        int mismatch_count = 0;
        
        while (fgets(result_line, sizeof(result_line), outfile) && 
               fgets(golden_line, sizeof(golden_line), goldenfile)) {
            line_num++;
            if (strcmp(result_line, golden_line) != 0) {
                if (mismatch_count < 10) {  // Only print first 10 mismatches
                    printf("Line %d mismatch: got %s, expected %s", 
                           line_num, result_line, golden_line);
                }
                mismatch_count++;
            }
        }
        
        fclose(outfile);
        fclose(goldenfile);
        
        if (mismatch_count > 0) {
            printf("FAILED: %d mismatches found\n", mismatch_count);
            retval = 1;
        } else {
            printf("Golden reference comparison PASSED\n");
        }
    } else {
        printf("\nNo golden reference found (result.golden.dat)\n");
        printf("Results saved to result.dat for manual verification\n");
    }
    
    if (retval == 0) {
        printf("\nTest passed !\n");
    } else {
        printf("\nTest FAILED !\n");
    }
    
    return retval;
}
