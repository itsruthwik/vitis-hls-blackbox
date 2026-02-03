/*
 * matrix_multiply_16x16.cpp
 * Top-level HLS function for 16x16 matrix multiplication
 * Behavioral implementation with streaming interface (no blackbox)
 */

#include "matrix_multiply_16x16.h"
#include "hls_stream.h"

void behavioral_multiply_16x16(
    hls::stream<ap_uint<128>>& a_stream,
    hls::stream<ap_uint<128>>& b_stream,
    hls::stream<ap_uint<256>>& c_stream
) {
    // Receive matrix A row by row (16 rows of 128-bit)
    ap_uint<128> a_data[16];
    for(int i = 0; i < 16; i++) {
        #pragma HLS unroll
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (16 columns of 128-bit)
    ap_uint<128> b_data[16];
    for(int i = 0; i < 16; i++) {
        #pragma HLS unroll
        b_data[i] = b_stream.read();
    }

    // Extract 16x16 matrices
    ap_int<8> a_mat[16][16];
    ap_int<8> b_mat[16][16];
    ap_int<16> c_mat[16][16];

    #pragma HLS array_partition variable=a_mat complete dim=1
    #pragma HLS array_partition variable=b_mat complete dim=2
    #pragma HLS array_partition variable=c_mat complete dim=2

    // Unpack A matrix (16x16 int8 values from array of 128-bit chunks)
    for(int i = 0; i < 16; i++) {
        for(int j = 0; j < 16; j++) {
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (16x16 int8 values from array of 128-bit chunks)
    for(int i = 0; i < 16; i++) {
        for(int j = 0; j < 16; j++) {
            b_mat[i][j] = b_data[i]((j+1)*8-1, j*8);
            c_mat[i][j] = 0;
        }
    }

    // Perform 16x16 matrix multiplication with II=4 for balanced latency/resources
    for(int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=4
        for(int j = 0; j < 16; j++) {
            #pragma HLS unroll
            ap_int<16> sum = 0;
            for(int k = 0; k < 16; k++) {
                #pragma HLS unroll factor=2
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Send result matrix C row by row via stream
    for(int i = 0; i < 16; i++) {
        #pragma HLS unroll
        ap_uint<256> c_row = 0;
        for(int j = 0; j < 16; j++) {
            #pragma HLS unroll
            ap_int<16> val = c_mat[i][j];
            for(int b = 0; b < 16; b++) {
                #pragma HLS unroll
                c_row[j*16 + b] = val[b];
            }
        }
        c_stream.write(c_row);
    }
}

//--------------------------------------------------------
// Top-level function for 16x16 matrix multiplication
// Memory-mapped interface at HLS level, streaming internally
void matrix_multiply_16x16(
    ap_int<8> A[16][16],
    ap_int<8> B[16][16],
    ap_int<16> C[16][16]
) {
    // Memory-mapped AXI interface for external access
    // Separate bundles to avoid dataflow conflicts with multiple readers
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return

    // Local arrays for internal computation
    ap_int<8> a_mat[16][16];
    ap_int<8> b_mat[16][16];
    ap_int<16> c_mat[16][16];

    #pragma HLS array_partition variable=a_mat block factor=4 dim=1
    #pragma HLS array_partition variable=b_mat block factor=4 dim=2
    #pragma HLS array_partition variable=c_mat block factor=4 dim=2

    // Read matrix A from memory with II=3 pipelining
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=3
        for (int j = 0; j < 16; j++) {
            a_mat[i][j] = A[i][j];
        }
    }

    // Read matrix B from memory with II=3 pipelining
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=3
        for (int j = 0; j < 16; j++) {
            b_mat[i][j] = B[i][j];
        }
    }

    // Perform 16x16 matrix multiplication with II=2 for target ~550-600 cycles
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

    // Write result matrix C back to memory with II=3 pipelining
    for (int i = 0; i < 16; i++) {
        #pragma HLS pipeline II=3
        for (int j = 0; j < 16; j++) {
            C[i][j] = c_mat[i][j];
        }
    }
}
