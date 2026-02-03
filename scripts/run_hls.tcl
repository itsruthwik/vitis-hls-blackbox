#
# Vitis HLS synthesis script 

# Check for command line arguments
if {[llength $argv] < 4} {
    puts "Error: Not enough arguments provided."
    puts "Usage: vitis_hls -f run_hls.tcl -tclargs <design_dir> <design_name> <cpp_file> <tb_file> [blackbox_json]"
    exit 1
}

# Set variables from arguments
set design_dir [lindex $argv 0]
set design_name [lindex $argv 1]
set cpp_file [lindex $argv 2]
set tb_file [lindex $argv 3]
set blackbox_json ""
if {[llength $argv] >= 5} {
    set blackbox_json [lindex $argv 4]
}

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
if {$blackbox_json ne ""} {
    puts "Blackbox JSON:  $blackbox_json"
}
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

# Add blackbox if specified
if {$blackbox_json ne ""} {
    if {[file exists $blackbox_json]} {
        add_files -blackbox $blackbox_json
        puts "Added blackbox: $blackbox_json"
    } else {
        puts "WARNING: Blackbox file not found: $blackbox_json"
    }
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
