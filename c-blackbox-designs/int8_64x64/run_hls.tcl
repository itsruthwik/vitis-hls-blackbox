# Design parameters (pre-configured for int8_64x64 blackbox)
set design_dir [file normalize [info script]/..] 
set design_name "matrix_multiply_64x64"
set cpp_file "matrix_multiply_64x64.cpp"
set tb_file "matrix_multiply_64x64_tb.cpp"

# Wrapper files from c-api-library
set wrapper_cpp "../../c-api-library/int8_64x64/int8_64x64_wrapper.cpp"
set wrapper_json "../../c-api-library/int8_64x64/int8_64x64_wrapper.json"

set part "xc7a100t-csg324-1"
set clock_period "200MHz"

puts "=========================================="
puts "HLS Synthesis Configuration"
puts "=========================================="
puts "Design Dir:     $design_dir"
puts "Design Name:    $design_name"
puts "C++ File:       $cpp_file"
puts "Wrapper CPP:    $wrapper_cpp"
puts "Wrapper JSON:   $wrapper_json"
puts "TB File:        $tb_file"
puts "=========================================="

cd $design_dir

open_project -reset ${design_name}_proj

# Add design files
add_files $cpp_file

# Add wrapper behavioral model and blackbox JSON
add_files $wrapper_cpp
add_files -blackbox $wrapper_json

# Add testbench
add_files -tb $tb_file

# Add golden reference if it exists
if {[file exists "result.golden.dat"]} {
    add_files -tb result.golden.dat
}

set_top $design_name

open_solution -reset ${design_name}_solution
set_part $part
create_clock -period "$clock_period"

puts "\nRunning C simulation..."
csim_design

puts "\nRunning C synthesis..."
csynth_design

puts "\nExporting Verilog RTL..."
export_design -rtl verilog

puts "\n=========================================="
puts "HLS synthesis completed for $design_name"
puts "Project:   ${design_name}_proj"
puts "Solution:  ${design_name}_solution"
puts "=========================================="

exit
