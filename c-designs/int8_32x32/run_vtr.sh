#!/bin/bash

# VTR Flow Runner for int8_32x32 design
# Runs VTR synthesis, packing, placement, and routing on HLS-generated Verilog

set -e

# Hardcoded paths
DESIGN_NAME="int8_32x32"
TOP_MODULE="matrix_multiply_32x32"

ROOT="/mnt/vault0/rsunketa/vitis-hls-blackbox"
SCRIPT_DIR="${ROOT}/c-designs/${DESIGN_NAME}"

VTR_ROOT="/mnt/vault0/rsunketa/vtr-verilog-to-routing"
VTR_FLOW="${VTR_ROOT}/vtr_flow/scripts/run_vtr_flow.py"
ARCH_FILE="${ROOT}/k6FracN10LB_mem20K_complexDSP_customSB_22nm.tensor_slice.20pct.xml"

# Project and verilog paths
PROJ_DIR="${SCRIPT_DIR}/${TOP_MODULE}_proj"
SOLUTION_DIR=$(find "${PROJ_DIR}" -maxdepth 1 -type d -name "*_solution" | head -1)
VERILOG_DIR="${SOLUTION_DIR}/syn/verilog"
DESIGN_FILE="${VERILOG_DIR}/${TOP_MODULE}.v"
VTR_RUN_DIR="${PROJ_DIR}/vtr_run"

# Collect include files (all .v except design file and tensor_slice_int8.v)
INCLUDE_FILES=()
for v_file in "${VERILOG_DIR}"/*.v; do
    basename=$(basename "$v_file")
    [ "$basename" = "${TOP_MODULE}.v" ] && continue
    [ "$basename" = "tensor_slice_int8.v" ] && continue
    INCLUDE_FILES+=("$v_file")
done

# Setup and run
mkdir -p "${VTR_RUN_DIR}"

echo "Running VTR flow for int8_32x32..."
echo "Design file: ${DESIGN_FILE}"
echo "Include files: ${#INCLUDE_FILES[@]}"
cd "${VTR_RUN_DIR}"

"${VTR_ROOT}/.venv/bin/python3" "${VTR_FLOW}" \
    "${DESIGN_FILE}" \
    "${ARCH_FILE}" \
    -parser "slang" \
    --route_chan_width 300 \
    -include "${INCLUDE_FILES[@]}"

echo "VTR flow completed!"
