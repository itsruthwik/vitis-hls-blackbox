/*
 * matrix_multiply_64x64.cpp
 * Top-level HLS function for 64x64 matrix multiplication
 * Uses memory-mapped AXI interface for matrices and streaming internally for wrapper
 */

#include "matrix_multiply_64x64.h"

//--------------------------------------------------------
// Forward declaration of the blackbox RTL wrapper
void int8_64x64_wrapper(
    hls::stream<ap_uint<512>>& a_stream,
    hls::stream<ap_uint<512>>& b_stream,
    hls::stream<ap_uint<1024>>& c_stream
);

//--------------------------------------------------------
// Top-level function for 64x64 matrix multiplication
// Memory-mapped interface at HLS level, streaming internally to wrapper
void matrix_multiply_64x64(
    ap_int<8> A[64][64],
    ap_int<8> B[64][64],
    ap_int<16> C[64][64]
)
{
    // Memory-mapped AXI interface for external access
    // Separate bundles to avoid dataflow conflicts with multiple readers
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return
    
    // Streams for internal communication with blackbox wrapper
    hls::stream<ap_uint<512>> a_stream;
    hls::stream<ap_uint<512>> b_stream;
    hls::stream<ap_uint<1024>> c_stream;

    #pragma HLS stream variable=a_stream depth=1
    #pragma HLS stream variable=b_stream depth=1
    #pragma HLS stream variable=c_stream depth=16

    // Dataflow region: producer/consumer pattern
    #pragma HLS dataflow
    {
        // Producer 1: Read matrix A from memory into stream
        // 64 rows, each row = 64 int8 values = 512 bits
        for (int i = 0; i < 64; i++) {
            ap_uint<512> row_a = 0;
            for (int j = 0; j < 64; j++) {
                row_a((j+1)*8-1, j*8) = (ap_uint<8>)A[i][j];
            }
            a_stream.write(row_a);
        }

        // Producer 2: Read matrix B from memory into stream
        // 64 columns, each column = 64 int8 values = 512 bits
        for (int j = 0; j < 64; j++) {
            ap_uint<512> col_b = 0;
            for (int i = 0; i < 64; i++) {
                col_b((i+1)*8-1, i*8) = (ap_uint<8>)B[i][j];
            }
            b_stream.write(col_b);
        }

        // Consumer 0: Blackbox wrapper performs 64x64 multiplication
        int8_64x64_wrapper(a_stream, b_stream, c_stream);

        // Consumer 1: Read results from stream and write to memory
        // 64 rows, each row = 64 int16 values = 1024 bits
        for (int i = 0; i < 64; i++) {
            ap_uint<1024> row_c = c_stream.read();
            for (int j = 0; j < 64; j++) {
                C[i][j] = (ap_int<16>)row_c((j+1)*16-1, j*16);
            }
        }
    }
}
