/*
 * matrix_multiply_16x16.cpp
 * Top-level HLS function for 16x16 matrix multiplication
 * Simplified non-dataflow version with moderate pipelining
 */

#include "matrix_multiply_16x16.h"

void matrix_multiply_16x16(
    ap_int<8> A[16][16],
    ap_int<8> B[16][16],
    ap_int<16> C[16][16]
) {
    // Memory-mapped AXI interface for external access
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return

    // Local arrays for internal computation (no dataflow, simpler structure)
    ap_int<8> a_mat[16][16];
    ap_int<8> b_mat[16][16];
    ap_int<16> c_mat[16][16];

    // Array partitioning: selective for moderate resource usage
    #pragma HLS array_partition variable=a_mat complete dim=1
    #pragma HLS array_partition variable=b_mat complete dim=2
    #pragma HLS array_partition variable=c_mat complete dim=1

    // Read matrix A from memory with II=2
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=2
        for (int j = 0; j < 16; j++) {
            a_mat[i][j] = A[i][j];
        }
    }

    // Read matrix B from memory with II=2
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=2
        for (int j = 0; j < 16; j++) {
            b_mat[i][j] = B[i][j];
        }
    }

    // Perform 16x16 matrix multiplication with II=2
    // This conservative approach should yield ~550+ cycles
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=2
        for (int j = 0; j < 16; j++) {
            #pragma HLS unroll
            ap_int<16> sum = 0;
            for (int k = 0; k < 16; k++) {
                #pragma HLS unroll factor=2
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Write result matrix C back to memory with II=2
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=2
        for (int j = 0; j < 16; j++) {
            C[i][j] = c_mat[i][j];
        }
    }
}
