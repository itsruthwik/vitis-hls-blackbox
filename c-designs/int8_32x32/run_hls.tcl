open_project -reset matrix_multiply_32x32_proj

# Add design files
add_files matrix_multiply_32x32.cpp

# Add test bench & files
add_files -tb matrix_multiply_32x32_tb.cpp
add_files -tb result.golden.dat

# JSON file from library (with updated wrapper path)
add_files -blackbox ../../library/int8_32x32/int8_32x32_wrapper.json

# Set the top-level function
set_top matrix_multiply_32x32

# ########################################################
# Create a solution
open_solution -reset int8_32x32_solution

# Define technology and clock rate
set_part  {xcvu9p-flga2104-2-i}
create_clock -period "200MHz"

# Set variable to select which steps to execute
set hls_exec 1

csim_design

# Set any optimization directives
# End of directives

if {$hls_exec == 1} {
	# Run Synthesis and Exit
	csynth_design
	
} elseif {$hls_exec == 2} {
	# Run Synthesis, RTL Simulation and Exit
	csynth_design	
}
