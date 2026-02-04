#include "ap_int.h"
#include "hls_stream.h"

// Behavioral model for int8_64x64_wrapper with AXI Stream interface
// This runs during C simulation only - RTL cosim uses the actual Verilog
void int8_64x64_wrapper(
    hls::stream<ap_uint<512>>& a_stream,    // AXI Stream input: 64 transfers of 512-bit rows
    hls::stream<ap_uint<512>>& b_stream,    // AXI Stream input: 64 transfers of 512-bit columns
    hls::stream<ap_uint<1024>>& c_stream    // AXI Stream output: 64 transfers of 1024-bit rows
) {
#pragma HLS interface axis port=a_stream
#pragma HLS interface axis port=b_stream
#pragma HLS interface axis port=c_stream
#pragma HLS interface ap_ctrl_none port=return

    // Receive matrix A row by row (64 rows of 512-bit)
    ap_uint<512> a_data[64];
    for(int i = 0; i < 64; i++) {
#pragma HLS pipeline II=2
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (64 columns of 512-bit)
    ap_uint<512> b_data[64];
    for(int i = 0; i < 64; i++) {
#pragma HLS pipeline II=2
        b_data[i] = b_stream.read();
    }

    // Extract 64x64 matrices from packed representation
    ap_int<8> a_mat[64][64];
    ap_int<8> b_mat[64][64];
    ap_int<16> c_mat[64][64];

#pragma HLS array_partition variable=a_mat block factor=8 dim=1
#pragma HLS array_partition variable=b_mat block factor=8 dim=2
#pragma HLS array_partition variable=c_mat block factor=8 dim=1

    // Unpack A matrix (64x64 int8 values from array of 512-bit chunks)
    for(int i = 0; i < 64; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 64; j++) {
#pragma HLS unroll factor=8
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (64x64 int8 values from array of 512-bit chunks)
    // B is sent column-by-column, so b_data[j] contains column j
    for(int i = 0; i < 64; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 64; j++) {
#pragma HLS unroll factor=8
            b_mat[i][j] = b_data[j]((i+1)*8-1, i*8);  // Fixed: swap i/j for column-major
            c_mat[i][j] = 0;
        }
    }

    // Perform 64x64 matrix multiplication: C = A * B
    for(int i = 0; i < 64; i++) {
#pragma HLS pipeline II=4
        for(int j = 0; j < 64; j++) {
#pragma HLS unroll factor=2
            ap_int<16> sum = 0;
            for(int k = 0; k < 64; k++) {
#pragma HLS unroll factor=4
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Pack and stream output matrix C row by row (1024-bit rows)
    // Each output transfer contains 64 16-bit values (one complete row of C)
    for(int row = 0; row < 64; row++) {
#pragma HLS pipeline II=2
        ap_uint<1024> c_row = 0;
        for(int col = 0; col < 64; col++) {
#pragma HLS unroll factor=8
            int bit_start = col * 16;
            c_row.range(bit_start + 15, bit_start) = c_mat[row][col];
        }
        c_stream.write(c_row);
    }
}
