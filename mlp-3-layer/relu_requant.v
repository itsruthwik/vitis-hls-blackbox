`timescale 1ns/1ps

//=============================================================================
// relu_requant — ReLU + Saturating Requantize  (16-bit → 8-bit)
//
//  Applied between MLP layers to bring INT16 partial sums back to INT8
//  before feeding the next systolic array.
//
//  Per element:
//    1. ReLU  : if value < 0  → 0
//    2. Clip  : if value > 127 → 127
//    3. Else  : keep lower 8 bits  (value fits in [0,127])
//
//  Fully combinational — no clock required.
//
//  Port packing (LSB-first, matching systolic_8x8_ws convention):
//    in_data  [j*16 +: 16] = 16-bit signed result for output j
//    out_data [j*8  +:  8] = 8-bit  INT8  result for output j
//=============================================================================
module relu_requant (
    input  wire [127:0] in_data,    // 8 × INT16 from systolic output
    output wire  [63:0] out_data    // 8 × INT8  after ReLU + clip
);
    genvar j;
    generate
        for (j = 0; j < 8; j = j + 1) begin : RELU
            wire signed [15:0] val = $signed(in_data[j*16 +: 16]);
            // ReLU: negative → 0
            // Saturate: > 127 → 127
            assign out_data[j*8 +: 8] =
                (val <= 16'sd0)   ? 8'd0   :
                (val >  16'sd127) ? 8'd127 :
                val[7:0];
        end
    endgenerate
endmodule

