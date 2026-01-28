#include "ap_int.h"
#include "hls_stream.h"

// Behavioral model for int8_16x16_wrapper with AXI Stream interface
// This runs during C simulation only - RTL cosim uses the actual Verilog
void int8_16x16_wrapper(
    hls::stream<ap_uint<128>>& a_stream,    // AXI Stream input: 16 transfers of 128-bit rows
    hls::stream<ap_uint<128>>& b_stream,    // AXI Stream input: 16 transfers of 128-bit columns
    hls::stream<ap_uint<256>>& c_stream     // AXI Stream output: 16 transfers of 256-bit rows
) {
#pragma HLS interface axis port=a_stream
#pragma HLS interface axis port=b_stream
#pragma HLS interface axis port=c_stream
#pragma HLS interface ap_ctrl_none port=return

    // Receive matrix A row by row (16 rows of 128-bit)
    // Store as array of 128-bit chunks instead of monolithic 2048-bit
    ap_uint<128> a_data[16];
    for(int i = 0; i < 16; i++) {
#pragma HLS unroll
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (16 columns of 128-bit)
    // Store as array of 128-bit chunks instead of monolithic 2048-bit
    ap_uint<128> b_data[16];
    for(int i = 0; i < 16; i++) {
#pragma HLS unroll
        b_data[i] = b_stream.read();
    }

    // Extract 16x16 matrices from packed representation
    ap_int<8> a_mat[16][16];
    ap_int<8> b_mat[16][16];
    ap_int<16> c_mat[16][16];

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

    // Perform 16x16 matrix multiplication: C = A * B
    for(int i = 0; i < 16; i++) {
        for(int j = 0; j < 16; j++) {
            for(int k = 0; k < 16; k++) {
                c_mat[i][j] += a_mat[i][k] * b_mat[k][j];
            }
        }
    }

    // Pack and stream output matrix C row by row (256-bit rows)
    // Each output transfer contains 16 16-bit values (one complete row of C)
    for(int row = 0; row < 16; row++) {
#pragma HLS unroll
        ap_uint<256> c_row = 0;
        for(int col = 0; col < 16; col++) {
            int bit_start = col * 16;
            c_row.range(bit_start + 15, bit_start) = c_mat[row][col];
        }
        c_stream.write(c_row);
    }
}

