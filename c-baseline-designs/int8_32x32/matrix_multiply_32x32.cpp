/*
 * matrix_multiply_32x32.cpp
 * Top-level HLS function for 32x32 matrix multiplication
 * Behavioral implementation with streaming interface (no blackbox)
 */

#include "matrix_multiply_32x32.h"
#include "hls_stream.h"

//--------------------------------------------------------
// Behavioral multiply function with streaming interface
// Similar to blackbox interface but fully synthesizable
void behavioral_multiply_32x32(
    hls::stream<ap_uint<256>>& a_stream,
    hls::stream<ap_uint<256>>& b_stream,
    hls::stream<ap_uint<512>>& c_stream
) {
    // Receive matrix A row by row (32 rows of 256-bit)
    ap_uint<256> a_data[32];
    for(int i = 0; i < 32; i++) {
        #pragma HLS unroll
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (32 columns of 256-bit)
    ap_uint<256> b_data[32];
    for(int i = 0; i < 32; i++) {
        #pragma HLS unroll
        b_data[i] = b_stream.read();
    }

    // Extract 32x32 matrices
    ap_int<8> a_mat[32][32];
    ap_int<8> b_mat[32][32];
    ap_int<16> c_mat[32][32];

    // Unpack A matrix (32x32 int8 values from array of 256-bit chunks)
    for(int i = 0; i < 32; i++) {
        for(int j = 0; j < 32; j++) {
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (32x32 int8 values from array of 256-bit chunks)
    for(int i = 0; i < 32; i++) {
        for(int j = 0; j < 32; j++) {
            b_mat[i][j] = b_data[i]((j+1)*8-1, j*8);
            c_mat[i][j] = 0;
        }
    }

    // Perform 32x32 matrix multiplication: C = A * B
    for(int i = 0; i < 32; i++) {
        for(int j = 0; j < 32; j++) {
            for(int k = 0; k < 32; k++) {
                c_mat[i][j] += a_mat[i][k] * b_mat[k][j];
            }
        }
    }

    // Send result matrix C row by row via stream
    for(int i = 0; i < 32; i++) {
        #pragma HLS unroll
        ap_uint<512> c_row = 0;
        for(int j = 0; j < 32; j++) {
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
// Top-level function for 32x32 matrix multiplication
// Memory-mapped interface at HLS level, streaming internally
void matrix_multiply_32x32(
    ap_int<8> A[32][32],
    ap_int<8> B[32][32],
    ap_int<16> C[32][32]
) {
    // Memory-mapped AXI interface for external access
    // Separate bundles to avoid dataflow conflicts with multiple readers
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return
    
    // Streams for internal communication
    hls::stream<ap_uint<256>> a_stream;
    hls::stream<ap_uint<256>> b_stream;
    hls::stream<ap_uint<512>> c_stream;

    #pragma HLS stream variable=a_stream depth=2
    #pragma HLS stream variable=b_stream depth=2
    #pragma HLS stream variable=c_stream depth=2

    // Dataflow region: producer/consumer pattern
    #pragma HLS dataflow
    {
        // Producer 1: Read matrix A from memory into stream
        // 32 rows, each row = 32 int8 values = 256 bits
        for (int i = 0; i < 32; i++) {
            ap_uint<256> row_a = 0;
            for (int j = 0; j < 32; j++) {
                row_a((j+1)*8-1, j*8) = (ap_uint<8>)A[i][j];
            }
            a_stream.write(row_a);
        }

        // Producer 2: Read matrix B from memory into stream
        // 32 columns, each column = 32 int8 values = 256 bits
        for (int j = 0; j < 32; j++) {
            ap_uint<256> col_b = 0;
            for (int i = 0; i < 32; i++) {
                col_b((i+1)*8-1, i*8) = (ap_uint<8>)B[i][j];
            }
            b_stream.write(col_b);
        }

        // Consumer 0: Behavioral multiply with streaming interface
        behavioral_multiply_32x32(a_stream, b_stream, c_stream);

        // Consumer 1: Read results from stream and write to memory
        // 32 rows, each row = 32 int16 values = 512 bits
        for (int i = 0; i < 32; i++) {
            ap_uint<512> row_c = c_stream.read();
            for (int j = 0; j < 32; j++) {
                C[i][j] = (ap_int<16>)row_c((j+1)*16-1, j*16);
            }
        }
    }
}
