#include "ap_int.h"
#include "hls_stream.h"

// Behavioral model for int8_8x8_wrapper with AXI Stream interface
// This runs during C simulation only - RTL cosim uses the actual Verilog
void int8_8x8_wrapper(
    hls::stream<ap_uint<64>>& a_stream,     // AXI Stream input: 8 transfers of 64-bit rows
    hls::stream<ap_uint<64>>& b_stream,     // AXI Stream input: 8 transfers of 64-bit columns
    hls::stream<ap_uint<128>>& c_stream     // AXI Stream output: 8 transfers of 128-bit rows
) {
#pragma HLS interface axis port=a_stream
#pragma HLS interface axis port=b_stream
#pragma HLS interface axis port=c_stream
#pragma HLS interface ap_ctrl_none port=return

    // Receive matrix A row by row (8 rows of 64-bit)
    // Store as array of 64-bit chunks instead of monolithic 512-bit
    ap_uint<64> a_data[8];
    for(int i = 0; i < 8; i++) {
#pragma HLS unroll
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (8 columns of 64-bit)
    // Store as array of 64-bit chunks instead of monolithic 512-bit
    ap_uint<64> b_data[8];
    for(int i = 0; i < 8; i++) {
#pragma HLS unroll
        b_data[i] = b_stream.read();
    }

    // Extract 8x8 matrices
    ap_int<8> a_mat[8][8];
    ap_int<8> b_mat[8][8];
    ap_int<16> c_mat[8][8];

    // Unpack A matrix (8x8 int8 values from array of 64-bit chunks)
    for(int i = 0; i < 8; i++) {
        for(int j = 0; j < 8; j++) {
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (8x8 int8 values from array of 64-bit chunks)
    for(int i = 0; i < 8; i++) {
        for(int j = 0; j < 8; j++) {
            b_mat[i][j] = b_data[i]((j+1)*8-1, j*8);
            c_mat[i][j] = 0;
        }
    }

    // Perform 8x8 matrix multiplication: C = A * B
    for(int i = 0; i < 8; i++) {
        for(int j = 0; j < 8; j++) {
            for(int k = 0; k < 8; k++) {
                c_mat[i][j] += a_mat[i][k] * b_mat[k][j];
            }
        }
    }

    // Send result matrix C row by row via AXI Stream
    for(int i = 0; i < 8; i++) {
#pragma HLS unroll
        ap_uint<128> c_row = 0;
        for(int j = 0; j < 8; j++) {
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
