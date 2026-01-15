#!/bin/bash
export GCC_EXEC_PREFIX=/packages/apps/fpga/Vitis_HLS/2022.1/tps/lnx64/gcc-8.3.0/libexec/gcc/

cd proj_tensor_slice_test/solution1/csim/build

# Fix csim.mk - add -fno-lto after IFLAG += -fPIC
sed -i '/^IFLAG += -fPIC$/a IFLAG += -fno-lto' csim.mk

# Fix Makefile.rules - insert after line 184 (before systemc line)
sed -i '184a LFLAG += -fno-lto\nLFLAG += -fno-use-linker-plugin\nLFLAG += -B/packages/apps/fpga/Vitis_HLS/2022.1/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0' Makefile.rules

make -f csim.mk clean
make -f csim.mk
