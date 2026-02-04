#include "ap_int.h"
#include "hls_stream.h"

// Behavioral model for int8_32x32_wrapper with AXI Stream interface
// This runs during C simulation only - RTL cosim uses the actual Verilog
void int8_32x32_wrapper(
    hls::stream<ap_uint<256>>& a_stream,    // AXI Stream input: 32 transfers of 256-bit rows
    hls::stream<ap_uint<256>>& b_stream,    // AXI Stream input: 32 transfers of 256-bit columns
    hls::stream<ap_uint<512>>& c_stream     // AXI Stream output: 32 transfers of 512-bit rows
) {
#pragma HLS interface axis port=a_stream
#pragma HLS interface axis port=b_stream
#pragma HLS interface axis port=c_stream
#pragma HLS interface ap_ctrl_none port=return

    // Receive matrix A row by row (32 rows of 256-bit)
    // Pipeline with II=2 to reduce resource overhead
    ap_uint<256> a_data[32];
    for(int i = 0; i < 32; i++) {
#pragma HLS pipeline II=2
        a_data[i] = a_stream.read();
    }

    // Receive matrix B column by column (32 columns of 256-bit)
    // Pipeline with II=2
    ap_uint<256> b_data[32];
    for(int i = 0; i < 32; i++) {
#pragma HLS pipeline II=2
        b_data[i] = b_stream.read();
    }

    // Extract 32x32 matrices from packed representation
    ap_int<8> a_mat[32][32];
    ap_int<8> b_mat[32][32];
    ap_int<16> c_mat[32][32];

#pragma HLS array_partition variable=a_mat block factor=8 dim=1
#pragma HLS array_partition variable=b_mat block factor=8 dim=2
#pragma HLS array_partition variable=c_mat block factor=8 dim=1

    // Unpack A matrix (32x32 int8 values from array of 256-bit chunks)
    for(int i = 0; i < 32; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 32; j++) {
#pragma HLS unroll factor=4
            a_mat[i][j] = a_data[i]((j+1)*8-1, j*8);
        }
    }

    // Unpack B matrix (32x32 int8 values from array of 256-bit chunks)
    for(int i = 0; i < 32; i++) {
#pragma HLS pipeline II=2
        for(int j = 0; j < 32; j++) {
#pragma HLS unroll factor=4
            b_mat[i][j] = b_data[j]((i+1)*8-1, i*8);
            c_mat[i][j] = 0;
        }
    }

    // Perform 32x32 matrix multiplication: C = A * B
    for(int i = 0; i < 32; i++) {
#pragma HLS pipeline II=3
        for(int j = 0; j < 32; j++) {
#pragma HLS unroll
            ap_int<16> sum = 0;
            for(int k = 0; k < 32; k++) {
#pragma HLS unroll factor=2
                sum += a_mat[i][k] * b_mat[k][j];
            }
            c_mat[i][j] = sum;
        }
    }

    // Pack and stream output matrix C row by row (512-bit rows)
    // Each output transfer contains 32 16-bit values (one complete row of C)
    for(int row = 0; row < 32; row++) {
#pragma HLS pipeline II=2
        ap_uint<512> c_row = 0;
        for(int col = 0; col < 32; col++) {
#pragma HLS unroll factor=4
            int bit_start = col * 16;
            c_row.range(bit_start + 15, bit_start) = c_mat[row][col];
        }
        c_stream.write(c_row);
    }
}
