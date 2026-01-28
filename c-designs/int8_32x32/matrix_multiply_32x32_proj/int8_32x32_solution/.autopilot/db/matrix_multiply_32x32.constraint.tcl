set clock_constraint { \
    name clk \
    module matrix_multiply_32x32 \
    port ap_clk \
    period 5 \
    uncertainty 1.35 \
}

set all_path {}

set false_path {}

