Run with:

```bash
bambu top.c \
    --top-fname=run_mlp_lo \
    $PWD/mlp_lib.xml \
    --file-input-data=mlp_wrapper.v,systolic_8x8_ws.v,relu_requant.v,mlp_3layer.v \
    --C-no-parse=mlp_stub.c \
    --generate-tb=test.run_mlp_lo.xml \
    --simulate \
    --simulator=VERILATOR

bambu top.c \
    --top-fname=run_mlp_hi \
    $PWD/mlp_lib.xml \
    --file-input-data=mlp_wrapper.v,systolic_8x8_ws.v,relu_requant.v,mlp_3layer.v \
    --C-no-parse=mlp_stub.c \
    --generate-tb=test.run_mlp_hi.xml \
    --simulate \
    --simulator=VERILATOR
