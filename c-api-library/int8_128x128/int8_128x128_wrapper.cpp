#define AP_INT_MAX_W 4096

#include "ap_int.h"
#include "hls_stream.h"


// Behavioral model for int8_128x128_wrapper with AXI Stream interface
// This runs during C simulation only - RTL cosim uses the actual Verilog
void int8_128x128_wrapper(
    hls::stream<ap_uint<1024>>& a_stream,    // AXI Stream input: 128 transfers of 1024-bit rows
    hls::stream<ap_uint<1024>>& b_stream,    // AXI Stream input: 128 transfers of 1024-bit columns
    hls::stream<ap_uint<2048>>& c_stream     // AXI Stream output: 128 transfers of 2048-bit rows
) {
#pragma HLS interface axis port=a_stream
#pragma HLS interface axis port=b_stream
#pragma HLS interface axis port=c_stream
#pragma HLS interface ap_ctrl_none port=return

    // Receive matrix A row by row (128 rows of 1024-bit)
    ap_uint<1024> a_data[128];
    for(int i = 0; i < 128; i++) {
#pragma HLS pipeline II=2
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (128 columns of 1024-bit)
    ap_uint<1024> b_data[128];
    for(int i = 0; i < 128; i++) {
#pragma HLS pipeline II=2
        b_data[i] = b_stream.read();
    }

    // Extract 128x128 matrices from packed representation
    ap_int<8> a_mat[128][128];
    ap_int<8> b_mat[128][128];
    ap_int<16> c_mat[128][128];

#pragma HLS array_partition variable=a_mat block factor=8 dim=1
#pragma HLS array_partition variable=b_mat block factor=8 dim=2
#pragma HLS array_partition variable=c_mat block factor=8 dim=1

    // Unpack A matrix (128x128 int8 values from array of 1024-bit chunks)
    for(int i = 0; i < 128; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 128; j++) {
#pragma HLS unroll factor=8
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (128x128 int8 values from array of 1024-bit chunks)
    // B is sent column-by-column, so b_data[j] contains column j
    for(int i = 0; i < 128; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 128; j++) {
#pragma HLS unroll factor=8
            b_mat[i][j] = b_data[j]((i+1)*8-1, i*8);  // Fixed: swap i/j for column-major
            c_mat[i][j] = 0;
        }
    }

    // Perform 128x128 matrix multiplication: C = A * B
    for(int i = 0; i < 128; i++) {
#pragma HLS pipeline II=4
        for(int j = 0; j < 128; j++) {
#pragma HLS unroll factor=2
            ap_int<16> sum = 0;
            for(int k = 0; k < 128; k++) {
#pragma HLS unroll factor=4
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Pack and stream output matrix C row by row (2048-bit rows)
    // Each output transfer contains 128 16-bit values (one complete row of C)
    for(int row = 0; row < 128; row++) {
#pragma HLS pipeline II=2
        ap_uint<2048> c_row = 0;
        for(int col = 0; col < 128; col++) {
#pragma HLS unroll factor=8
            int bit_start = col * 16;
            c_row.range(bit_start + 15, bit_start) = c_mat[row][col];
        }
        c_stream.write(c_row);
    }
}
