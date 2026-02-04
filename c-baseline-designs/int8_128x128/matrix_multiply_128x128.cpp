/*
 * matrix_multiply_128x128.cpp
 * 128x128 matrix multiplication using 2x2 tiling of 64x64 blocks
 * Optimized for performance with local accumulation buffer
 */

#include "matrix_multiply_128x128.h"

// Extract 64x64 tile from 128x128 source matrix
void extract_tile_64x64(
    ap_int<8> src[128][128],
    ap_int<8> dst[64][64],
    int tile_row,
    int tile_col
) {
#pragma HLS INLINE off
    int row_offset = tile_row * 64;
    int col_offset = tile_col * 64;
    
    for(int i = 0; i < 64; i++) {
        for(int j = 0; j < 64; j++) {
#pragma HLS PIPELINE II=1
            dst[i][j] = src[row_offset + i][col_offset + j];
        }
    }
}

// Top-level: 128x128 matrix multiplication using 2x2 tiling
void matrix_multiply_128x128(
    ap_int<8> A[128][128],
    ap_int<8> B[128][128],
    ap_int<16> C[128][128]
) {
#pragma HLS INTERFACE m_axi port=A bundle=gmem_a
#pragma HLS INTERFACE m_axi port=B bundle=gmem_b
#pragma HLS INTERFACE m_axi port=C bundle=gmem_c
#pragma HLS INTERFACE s_axilite port=return

    // Local result buffer - accumulate here to avoid read-modify-write on gmem_c
    ap_int<16> C_result[128][128];

    // Initialize local result buffer
    for(int i = 0; i < 128; i++) {
        for(int j = 0; j < 128; j++) {
#pragma HLS PIPELINE II=1
            C_result[i][j] = 0;
        }
    }

    // Block matrix multiplication: C[i,j] = Σ_k A[i,k] × B[k,j]
    // 2×2 tiling: i,j,k ∈ {0,1} represent tile indices
    for(int ti = 0; ti < 2; ti++) {          // Output row tiles
        for(int tj = 0; tj < 2; tj++) {      // Output col tiles
            for(int tk = 0; tk < 2; tk++) {  // Inner dimension tiles
                
                // Tile buffers
                ap_int<8> A_tile[64][64];
                ap_int<8> B_tile[64][64];
                ap_int<16> C_tile[64][64];
                
                // Extract 64×64 tiles from 128×128 matrices
                extract_tile_64x64(A, A_tile, ti, tk);
                extract_tile_64x64(B, B_tile, tk, tj);
                
                // Perform 64×64 multiplication using imported function
                matrix_multiply_64x64(A_tile, B_tile, C_tile);
                
                // Accumulate result into local buffer
                int row_offset = ti * 64;
                int col_offset = tj * 64;
                for(int i = 0; i < 64; i++) {
                    for(int j = 0; j < 64; j++) {
#pragma HLS PIPELINE II=1
                        C_result[row_offset + i][col_offset + j] += C_tile[i][j];
                    }
                }
            }
        }
    }

    // Write final result to global memory (pure write, no read-modify-write)
    for(int i = 0; i < 128; i++) {
        for(int j = 0; j < 128; j++) {
#pragma HLS PIPELINE II=1
            C[i][j] = C_result[i][j];
        }
    }
}
