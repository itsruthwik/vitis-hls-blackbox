#
# Vitis HLS synthesis script for int8_16x16 design
# Pre-configured with design-specific parameters
#

# Design parameters (pre-configured for int8_16x16)
set design_dir [file normalize [info script]/..] 
set design_name "matrix_multiply_16x16"
set cpp_file "matrix_multiply_16x16.cpp"
set tb_file "matrix_multiply_16x16_tb.cpp"
set blackbox_json "../../library/int8_16x16/int8_16x16_wrapper.json"

# Hardcoded settings
set part "xc7a100t-csg324-1"
set clock_period "200MHz"

puts "=========================================="
puts "HLS Synthesis Configuration"
puts "=========================================="
puts "Design Dir:     $design_dir"
puts "Design Name:    $design_name"
puts "C++ File:       $cpp_file"
puts "TB File:        $tb_file"
puts "Blackbox JSON:  $blackbox_json"
puts "Part:           $part"
puts "Clock Period:   $clock_period"
puts "=========================================="

# Change to design directory
cd $design_dir

# Create a project
open_project -reset ${design_name}_proj

# Add design files
add_files $cpp_file

# Add test bench
add_files -tb $tb_file

# Add blackbox
if {[file exists $blackbox_json]} {
    add_files -blackbox $blackbox_json
    puts "Added blackbox: $blackbox_json"
} else {
    puts "WARNING: Blackbox file not found: $blackbox_json"
}

# Set the top-level function
set_top $design_name

# Create a solution
open_solution -reset ${design_name}_solution

# Define technology and clock rate
set_part $part
create_clock -period "$clock_period"

# Run simulation and synthesis
puts "\nRunning C simulation..."
csim_design

puts "\nRunning C synthesis..."
csynth_design

# Export RTL Verilog
puts "\nExporting Verilog RTL..."
export_design -rtl verilog

puts "\n=========================================="
puts "HLS synthesis completed for $design_name"
puts "Project:   ${design_name}_proj"
puts "Solution:  ${design_name}_solution"
puts "=========================================="

exit
