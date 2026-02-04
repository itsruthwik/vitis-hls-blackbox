/*
 * matrix_multiply_128x128.cpp
 * Top-level HLS function for 128x128 matrix multiplication
 * Uses memory-mapped AXI interface for matrices and streaming internally for wrapper
 */

#define AP_INT_MAX_W 4096

#include "matrix_multiply_128x128.h"

//--------------------------------------------------------
// Forward declaration of the blackbox RTL wrapper
void int8_128x128_wrapper(
    hls::stream<ap_uint<1024>>& a_stream,
    hls::stream<ap_uint<1024>>& b_stream,
    hls::stream<ap_uint<2048>>& c_stream
);

//--------------------------------------------------------
// Top-level function for 128x128 matrix multiplication
// Memory-mapped interface at HLS level, streaming internally to wrapper
void matrix_multiply_128x128(
    ap_int<8> A[128][128],
    ap_int<8> B[128][128],
    ap_int<16> C[128][128]
)
{
    // Memory-mapped AXI interface for external access
    // Separate bundles to avoid dataflow conflicts with multiple readers
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return
    
    // Streams for internal communication with blackbox wrapper
    hls::stream<ap_uint<1024>> a_stream;
    hls::stream<ap_uint<1024>> b_stream;
    hls::stream<ap_uint<2048>> c_stream;

    #pragma HLS stream variable=a_stream depth=1
    #pragma HLS stream variable=b_stream depth=1
    #pragma HLS stream variable=c_stream depth=16

    // Dataflow region: producer/consumer pattern
    #pragma HLS dataflow
    {
        // Producer 1: Read matrix A from memory into stream
        // 128 rows, each row = 128 int8 values = 1024 bits
        for (int i = 0; i < 128; i++) {
            ap_uint<1024> row_a = 0;
            for (int j = 0; j < 128; j++) {
                row_a((j+1)*8-1, j*8) = (ap_uint<8>)A[i][j];
            }
            a_stream.write(row_a);
        }

        // Producer 2: Read matrix B from memory into stream
        // 128 columns, each column = 128 int8 values = 1024 bits
        for (int j = 0; j < 128; j++) {
            ap_uint<1024> col_b = 0;
            for (int i = 0; i < 128; i++) {
                col_b((i+1)*8-1, i*8) = (ap_uint<8>)B[i][j];
            }
            b_stream.write(col_b);
        }

        // Consumer 0: Blackbox wrapper performs 128x128 multiplication
        int8_128x128_wrapper(a_stream, b_stream, c_stream);

        // Consumer 1: Read results from stream and write to memory
        // 128 rows, each row = 128 int16 values = 2048 bits
        for (int i = 0; i < 128; i++) {
            ap_uint<2048> row_c = c_stream.read();
            for (int j = 0; j < 128; j++) {
                C[i][j] = (ap_int<16>)row_c((j+1)*16-1, j*16);
            }
        }
    }
}
