# Design parameters (pre-configured for int8_64x64)
set design_dir [file normalize [info script]/..] 
set design_name "matrix_multiply_64x64"
set cpp_file "matrix_multiply_64x64.cpp"
set tb_file "matrix_multiply_64x64_tb.cpp"

# NEW: Add 32x32 implementation as library
set lib_32x32 "../int8_32x32/matrix_multiply_32x32.cpp"

set part "xc7a100t-csg324-1"
set clock_period "200MHz"

puts "=========================================="
puts "HLS Synthesis Configuration"
puts "=========================================="
puts "Design Dir:     $design_dir"
puts "Design Name:    $design_name"
puts "C++ File:       $cpp_file"
puts "Library:        $lib_32x32"
puts "TB File:        $tb_file"
puts "=========================================="

cd $design_dir

open_project -reset ${design_name}_proj

# Add BOTH source files
add_files $cpp_file
add_files $lib_32x32

add_files -tb $tb_file

# Add golden reference if it exists
if {[file exists "result.golden.dat"]} {
    add_files -tb result.golden.dat
}

set_top $design_name

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
