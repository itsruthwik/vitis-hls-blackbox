#!/bin/bash

# VTR Flow Runner for int8_16x16 design
# Runs VTR synthesis, packing, placement, and routing on HLS-generated Verilog

set -e

# Hardcoded paths
DESIGN_NAME="int8_16x16"
TOP_MODULE="matrix_multiply_16x16"

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
if [ -d "${VTR_RUN_DIR}" ]; then rm -rf "${VTR_RUN_DIR}"; fi
mkdir -p "${VTR_RUN_DIR}"

# Create inc_modules.v with include statements
INC_MODULES_FILE="${VTR_RUN_DIR}/inc_modules.v"
echo "// Auto-generated include file for VTR synthesis" > "${INC_MODULES_FILE}"
echo "// Generated from run_vtr.sh" >> "${INC_MODULES_FILE}"
echo "" >> "${INC_MODULES_FILE}"
for inc_file in "${INCLUDE_FILES[@]}"; do
    echo "\`include \"${inc_file}\"" >> "${INC_MODULES_FILE}"
done

echo "Running VTR flow for int8_16x16..."
echo "Design file: ${DESIGN_FILE}"
echo "Include file: ${INC_MODULES_FILE}"
echo "Number of included modules: ${#INCLUDE_FILES[@]}"

# Fix for-loop bounds in Verilog functions for Yosys compatibility
echo "Fixing for-loop bounds in Verilog files..."
python3 "${ROOT}/fix_for_loops.py" "${VERILOG_DIR}"

cd "${VTR_RUN_DIR}"

if [ -d "${VTR_RUN_DIR}/temp" ]; then rm -rf "${VTR_RUN_DIR}/temp"; fi


"${VTR_ROOT}/.venv/bin/python3" "${VTR_FLOW}" \
    "${DESIGN_FILE}" \
    "${ARCH_FILE}" \
    --route_chan_width 300 \
    -include "${INC_MODULES_FILE}"


echo "VTR flow completed!"