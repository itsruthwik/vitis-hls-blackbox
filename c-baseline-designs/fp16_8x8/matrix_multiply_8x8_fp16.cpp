/*
 * matrix_multiply_8x8_fp16.cpp
 * Top-level HLS function for 8x8 matrix multiplication
 * Behavioral implementation with ap_fixed<16,6> precision (no blackbox)
 */

#include "matrix_multiply_8x8_fp16.h"
#include "hls_stream.h"

//--------------------------------------------------------
// Top-level function for 8x8 matrix multiplication
void matrix_multiply_8x8_fp16(
    ap_fixed<16,6> A[8][8],
    ap_fixed<16,6> B[8][8],
    ap_fixed<40,16> C[8][8]
) {
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return

    // Local arrays for internal computation
    ap_fixed<16,6> a_mat[8][8];
    ap_fixed<16,6> b_mat[8][8];
    ap_fixed<40,16> c_mat[8][8];

    #pragma HLS array_partition variable=a_mat complete dim=0
    #pragma HLS array_partition variable=b_mat complete dim=0
    #pragma HLS array_partition variable=c_mat complete dim=0

    // Read matrix A from memory with II=1 pipeline
    for (int idx = 0; idx < 64; idx++) {
        #pragma HLS pipeline II=1
        a_mat[idx >> 3][idx & 7] = A[idx >> 3][idx & 7];
    }

    // Read matrix B from memory with II=1 pipeline
    for (int idx = 0; idx < 64; idx++) {
        #pragma HLS pipeline II=1
        b_mat[idx >> 3][idx & 7] = B[idx >> 3][idx & 7];
    }

    // Compute C with tight pipelining
    for (int i = 0; i < 8; i++) {
        #pragma HLS pipeline II=1
        for (int j = 0; j < 8; j++) {
            #pragma HLS unroll
            ap_fixed<40,16> sum = 0;
            for (int k = 0; k < 8; k++) {
                #pragma HLS unroll
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Write result matrix C back to memory with II=1 pipeline
    for (int idx = 0; idx < 64; idx++) {
        #pragma HLS pipeline II=1
        C[idx >> 3][idx & 7] = c_mat[idx >> 3][idx & 7];
    }
}
