#
# TCL script for tensor_slice_wrapper blackbox integration
# Based on Xilinx RTL as Blackbox example for Vitis HLS 2022.1
#

# Create a project
open_project -reset proj_tensor_slice_test

# Add design files
add_files tensor_slice_test.cpp
# Add test bench & files
add_files -tb tensor_slice_test_tb.cpp
add_files -tb result.golden.dat
# JSON file
add_files -blackbox tensor_slice_wrapper.json

# Set the top-level function
set_top tensor_slice_test

# ########################################################
# Create a solution
open_solution -reset solution1
# Define technology and clock rate
set_part  {xcvu9p-flga2104-2-i}
create_clock -period "200MHz"

# Set variable to select which steps to execute
set hls_exec 3

csim_design

# Set any optimization directives
# End of directives

if {$hls_exec == 1} {
	# Run Synthesis and Exit
	csynth_design
	
} elseif {$hls_exec == 2} {
	# Run Synthesis, RTL Simulation and Exit
	csynth_design	
	cosim_design
} elseif {$hls_exec == 3} { 
	# Run Synthesis, RTL Simulation, RTL implementation and Exit
	csynth_design	
	cosim_design
	export_design -rtl verilog -flow impl
} else {
	# Default is to exit after setup
	csynth_design
}

exit
