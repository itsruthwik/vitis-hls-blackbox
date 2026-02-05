# Design parameters for matrix_multiply_8x8_fp16
set design_dir [file normalize [info script]/..] 
set design_name "matrix_multiply_8x8_fp16"
set cpp_file "matrix_multiply_8x8_fp16.cpp"
set tb_file "matrix_multiply_8x8_fp16_tb.cpp"

set part "xcvu9p-flga2104-2-i"
set clock_period "200MHz"

puts "=========================================="
puts "HLS Synthesis Configuration"
puts "=========================================="
puts "Design Dir:     $design_dir"
puts "Design Name:    $design_name"
puts "C++ File:       $cpp_file"
puts "TB File:        $tb_file"
puts "Part:           $part"
puts "Clock:          $clock_period"
puts "=========================================="

cd $design_dir

open_project -reset ${design_name}_proj

# Add design files
add_files $cpp_file

# Add testbench
add_files -tb $tb_file

# Add golden reference if it exists
if {[file exists "result.golden.dat"]} {
    add_files -tb result.golden.dat
    puts "Added golden reference file"
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
