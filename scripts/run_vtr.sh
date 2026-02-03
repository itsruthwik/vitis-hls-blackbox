#!/bin/bash

# VTR Flow Runner Script
set -e

# Check for arguments
if [ $# -lt 5 ]; then
    echo "Error: Not enough arguments provided."
    echo "Usage: $0 <verilog_dir> <top_module> <inc_files> <vtr_run_dir> <root>"
    exit 1
fi

# Set variables from arguments
VERILOG_DIR="$1"
TOP_MODULE="$2"
INC_FILES="$3"
VTR_RUN_DIR="$4"
ROOT="$5"


VTR_ROOT="${ROOT}/vtr-verilog-to-routing"

VTR_FLOW="${VTR_ROOT}/vtr_flow/scripts/run_vtr_flow.py"
ARCH_FILE="${ROOT}/scripts/k6FracN10LB_mem20K_complexDSP_customSB_22nm.tensor_slice.20pct.xml"


# Project and verilog paths


DESIGN_FILE="${VERILOG_DIR}/${TOP_MODULE}.v"

# Collect include files (all .v except design file and tensor_slice_int8.v)
INCLUDE_FILES=()
for v_file in "${VERILOG_DIR}"/*.v; do
    basename=$(basename "$v_file")
    [ "$basename" = "${TOP_MODULE}.v" ] && continue
    [ "$basename" = "tensor_slice_int8.v" ] && continue
    INCLUDE_FILES+=("$v_file")
done

#  if INC_FILES is not empty, add those files to INCLUDE_FILES
if [ -n "$INC_FILES" ]; then
    IFS=',' read -ra ADDITIONAL_FILES <<< "$INC_FILES"
    for file in "${ADDITIONAL_FILES[@]}"; do
        INCLUDE_FILES+=("$file")
    done
fi


echo "--- Design file: ${DESIGN_FILE}"
# echo "--- Include files: ${INCLUDE_FILES[*]}"
echo "--- Number of included modules: ${#INCLUDE_FILES[@]}"

# Fix for-loop bounds in Verilog functions for Yosys compatibility
echo "--- Fixing for-loop bounds in Verilog files..."
python3 "${ROOT}/scripts/fix_for_loops.py" "${VERILOG_DIR}"

cd "${VTR_RUN_DIR}"

if [ -d "${VTR_RUN_DIR}/temp" ]; then rm -rf "${VTR_RUN_DIR}/temp"; fi

# Build the command
VTR_CMD="${VTR_ROOT}/.venv/bin/python3 ${VTR_FLOW} ${DESIGN_FILE} ${ARCH_FILE} --route_chan_width 300 --sdc_file ${ROOT}/scripts/clock.sdc -delete_intermediate_files -include ${INCLUDE_FILES[*]}"

# echo "$VTR_CMD"
echo "--- Running VTR flow for ${TOP_MODULE}"
eval "$VTR_CMD" > /dev/null


echo "VTR flow completed!"
echo "-----------------------------"