/*
 * matrix_multiply_64x64_32api.cpp
 * Top-level HLS function for 64x64 matrix multiplication
 * Uses 2x2 tiling of int8_32x32_wrapper blackbox for computation
 */

#include "matrix_multiply_64x64_32api.h"

// Top-level function for 64x64 matrix multiplication using 32x32 tiles
void matrix_multiply_64x64_32api(
    ap_int<8> A[64][64],
    ap_int<8> B[64][64],
    ap_int<16> C[64][64]
)
{
    // Memory-mapped AXI interface for external access
    #pragma HLS interface mode=m_axi port=A offset=slave bundle=gmem_a
    #pragma HLS interface mode=m_axi port=B offset=slave bundle=gmem_b
    #pragma HLS interface mode=m_axi port=C offset=slave bundle=gmem_c
    #pragma HLS interface s_axilite port=return
    
    // Local buffers for input matrices
    ap_int<8> a_local[64][64];
    ap_int<8> b_local[64][64];
    ap_int<16> c_local[64][64];
    
    // Read A and B from memory
    for(int i = 0; i < 64; i++) {
        for(int j = 0; j < 64; j++) {
#pragma HLS PIPELINE II=1
            a_local[i][j] = A[i][j];
            b_local[i][j] = B[i][j];
            c_local[i][j] = 0;
        }
    }
    
    // Perform tiled multiplication: 2x2 tiling with k accumulation
    for(int ti = 0; ti < 2; ti++) {          // Output row tiles
        for(int tj = 0; tj < 2; tj++) {      // Output col tiles
            for(int tk = 0; tk < 2; tk++) {  // Inner dimension tiles
                
                // Create streams for 32x32 wrapper
                hls::stream<ap_uint<256>> tile_a_stream;
                hls::stream<ap_uint<256>> tile_b_stream;
                hls::stream<ap_uint<512>> tile_c_stream;
                
#pragma HLS stream variable=tile_a_stream depth=2
#pragma HLS stream variable=tile_b_stream depth=2
#pragma HLS stream variable=tile_c_stream depth=2
                
                // Pack A tile (32 rows of 256-bit)
                for(int i = 0; i < 32; i++) {
                    ap_uint<256> row = 0;
                    for(int j = 0; j < 32; j++) {
                        row((j+1)*8-1, j*8) = (ap_uint<8>)a_local[ti*32 + i][tk*32 + j];
                    }
                    tile_a_stream.write(row);
                }
                
                // Pack B tile (32 columns of 256-bit)
                for(int j = 0; j < 32; j++) {
                    ap_uint<256> col = 0;
                    for(int i = 0; i < 32; i++) {
                        col((i+1)*8-1, i*8) = (ap_uint<8>)b_local[tk*32 + i][tj*32 + j];
                    }
                    tile_b_stream.write(col);
                }
                
                // Call 32x32 wrapper blackbox
                int8_32x32_wrapper(tile_a_stream, tile_b_stream, tile_c_stream);
                
                // Unpack and accumulate result (32 rows of 512-bit)
                for(int i = 0; i < 32; i++) {
                    ap_uint<512> row_c = tile_c_stream.read();
                    for(int j = 0; j < 32; j++) {
                        ap_int<16> val = row_c((j+1)*16-1, j*16);
                        c_local[ti*32 + i][tj*32 + j] += val;
                    }
                }
            }
        }
    }
    
    // Write C back to memory
    for(int i = 0; i < 64; i++) {
        for(int j = 0; j < 64; j++) {
#pragma HLS PIPELINE II=1
            C[i][j] = c_local[i][j];
        }
    }
}
