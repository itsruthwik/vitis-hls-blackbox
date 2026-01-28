/*
 * matrix_multiply_16x16.cpp
 * Top-level HLS function for 16x16 matrix multiplication
 * Uses memory-mapped AXI interface for matrices and streaming internally for wrapper
 */

#include "matrix_multiply_16x16.h"

//--------------------------------------------------------
// Forward declaration of the blackbox RTL wrapper
void int8_16x16_wrapper(
    hls::stream<ap_uint<128>>& a_stream,
    hls::stream<ap_uint<128>>& b_stream,
    hls::stream<ap_uint<256>>& c_stream
);

//--------------------------------------------------------
// Top-level function for 16x16 matrix multiplication
// Memory-mapped interface at HLS level, streaming internally to wrapper
void matrix_multiply_16x16(
    ap_int<8> A[16][16],
    ap_int<8> B[16][16],
    ap_int<16> C[16][16]
)
{
    // Memory-mapped AXI interface for external access
    // Separate bundles to avoid dataflow conflicts with multiple readers
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return
    
    // Streams for internal communication with blackbox wrapper
    hls::stream<ap_uint<128>> a_stream;
    hls::stream<ap_uint<128>> b_stream;
    hls::stream<ap_uint<256>> c_stream;

    #pragma HLS stream variable=a_stream depth=2
    #pragma HLS stream variable=b_stream depth=2
    #pragma HLS stream variable=c_stream depth=2

    // Dataflow region: producer/consumer pattern
    #pragma HLS dataflow
    {
        // Producer 1: Read matrix A from memory into stream
        // 16 rows, each row = 16 int8 values = 128 bits
        for (int i = 0; i < 16; i++) {
            ap_uint<128> row_a = 0;
            for (int j = 0; j < 16; j++) {
                row_a((j+1)*8-1, j*8) = (ap_uint<8>)A[i][j];
            }
            a_stream.write(row_a);
        }

        // Producer 2: Read matrix B from memory into stream
        // 16 columns, each column = 16 int8 values = 128 bits
        for (int j = 0; j < 16; j++) {
            ap_uint<128> col_b = 0;
            for (int i = 0; i < 16; i++) {
                col_b((i+1)*8-1, i*8) = (ap_uint<8>)B[i][j];
            }
            b_stream.write(col_b);
        }

        // Consumer 0: Blackbox wrapper performs 16x16 multiplication
        int8_16x16_wrapper(a_stream, b_stream, c_stream);

        // Consumer 1: Read results from stream and write to memory
        // 16 rows, each row = 16 int16 values = 256 bits
        for (int i = 0; i < 16; i++) {
            ap_uint<256> row_c = c_stream.read();
            for (int j = 0; j < 16; j++) {
                C[i][j] = (ap_int<16>)row_c((j+1)*16-1, j*16);
            }
        }
    }
}
