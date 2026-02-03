#
# Vivado synthesis script for int8_32x32 design
# Pre-configured with design-specific parameters
#

# Design parameters (pre-configured for int8_32x32)
set project_dir [file normalize [info script]/..]
set design_name "matrix_multiply_32x32"
set hls_proj_name "${design_name}_proj"
set hls_solution "${design_name}_solution"

# Hardcoded settings
set part "xc7a100t-csg324-1"

puts "=========================================="
puts "Vivado Synthesis Configuration"
puts "=========================================="
puts "Project Dir:    $project_dir"
puts "Design Name:    $design_name"
puts "HLS Project:    $hls_proj_name"
puts "HLS Solution:   $hls_solution"
puts "Part:           $part"
puts "=========================================="

# Change to project directory
cd $project_dir

# Determine HLS export directory
set hls_export_dir "${project_dir}/${hls_proj_name}/${design_name}/solution/impl/verilog"
if {![file exists $hls_export_dir]} {
    set hls_export_dir "${project_dir}/${hls_proj_name}/${hls_solution}/impl/verilog"
}

if {![file exists $hls_export_dir]} {
    puts "ERROR: HLS export directory not found!"
    puts "Searched in:"
    puts "  ${project_dir}/${hls_proj_name}/${design_name}/solution/impl/verilog"
    puts "  ${project_dir}/${hls_proj_name}/${hls_solution}/impl/verilog"
    exit 1
}

puts "HLS Export Dir: $hls_export_dir\n"

# Create a new Vivado project
create_project -force ${design_name}_vivado_proj -part $part

# Add the exported Verilog files from HLS
puts "Adding Verilog files from HLS export directory..."
add_files -fileset sources_1 [glob $hls_export_dir/*.v]

# No blackbox for behavioral implementation

# Set the top module
set_property top $design_name [current_fileset]

puts "\nRunning synthesis for $design_name..."

# Run synthesis with -lib option to prevent primitive duplication
synth_design -top $design_name -part $part

puts "Generating utilization report..."
report_utilization -file ${design_name}_utilization.rpt

# Write EDIF netlist (for SpyDrNet conversion to BLIF)
# puts "Writing EDIF netlist..."
# write_edif -force ${design_name}_synth.edif

# puts "Writing Verilog netlist..."
# write_verilog -force ${design_name}_synth.v 

puts "\n=========================================="
puts "Vivado synthesis completed for $design_name"
puts "Project:   ${design_name}_vivado_proj"
puts "EDIF:      ${design_name}_synth.edif"
puts "Verilog:   ${design_name}_synth.v"
puts "Report:    ${design_name}_utilization.rpt"
puts "=========================================="

exit
