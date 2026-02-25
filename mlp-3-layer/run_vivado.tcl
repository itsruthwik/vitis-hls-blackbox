#==============================================================================
# run_vivado_mlp.tcl
# Vivado synthesis + implementation for mlp_3layer (8x8x8x8, INT8, WS)
#
# Usage (batch mode):
#   vivado -mode batch -source run_vivado_mlp.tcl
#
# Output:
#   ./vivado_mlp/reports/   — timing, utilization, power reports
#   ./vivado_mlp/outputs/   — bitstream + netlists (if impl runs to completion)
#
# Target: xcvu9p-flga2104-2-i  (matching HLS TCL target)
# Clock:  5ns (200 MHz)
#==============================================================================

#------------------------------------------------------------------------------
# Project setup
#------------------------------------------------------------------------------
set project_name  mlp_3layer_impl
set project_dir   ./vivado_mlp
set part          xcvu9p-flga2104-2-i
set top           mlp_3layer
set clk_period_ns 5.0

# Source files — adjust paths if running from a different directory
set src_files {
    systolic_8x8_ws.v
    relu_requant.v
    mlp_3layer.v
}

#------------------------------------------------------------------------------
# Create project
#------------------------------------------------------------------------------
create_project $project_name $project_dir -part $part -force

set_property target_language Verilog [current_project]

# Add RTL sources
foreach f $src_files {
    add_files -norecurse $f
}
update_compile_order -fileset sources_1

# Set top
set_property top $top [current_fileset]

#------------------------------------------------------------------------------
# Constraints — clock only (no pin assignments needed for metrics)
#------------------------------------------------------------------------------
set constraints_file $project_dir/${project_name}.srcs/constrs_1/new/clk.xdc
file mkdir [file dirname $constraints_file]
set fh [open $constraints_file w]
puts $fh "create_clock -period ${clk_period_ns} -name clk \[get_ports clk\]"
puts $fh "set_input_delay  0 -clock clk \[all_inputs\]"
puts $fh "set_output_delay 0 -clock clk \[all_outputs\]"
close $fh
add_files -fileset constrs_1 -norecurse $constraints_file

#------------------------------------------------------------------------------
# Report directory
#------------------------------------------------------------------------------
set rpt_dir $project_dir/reports
file mkdir $rpt_dir

#------------------------------------------------------------------------------
# Synthesis
#------------------------------------------------------------------------------
puts "=== Running Synthesis ==="
synth_design -top $top -part $part \
             -flatten_hierarchy rebuilt \
             -directive PerformanceOptimized

report_utilization       -file $rpt_dir/synth_utilization.rpt
report_timing_summary    -file $rpt_dir/synth_timing.rpt \
                         -max_paths 10 -report_unconstrained
report_drc               -file $rpt_dir/synth_drc.rpt

puts "=== Synthesis complete. Reports in $rpt_dir ==="

#------------------------------------------------------------------------------
# Implementation
#------------------------------------------------------------------------------
puts "=== Running Implementation ==="

opt_design
place_design   -directive ExtraNetDelay_high
phys_opt_design
route_design   -directive AggressiveExplore

report_timing_summary    -file $rpt_dir/impl_timing.rpt \
                         -max_paths 20 -report_unconstrained
report_utilization       -file $rpt_dir/impl_utilization.rpt
report_power             -file $rpt_dir/impl_power.rpt
report_clock_utilization -file $rpt_dir/impl_clock_util.rpt
report_route_status      -file $rpt_dir/impl_route_status.rpt

#------------------------------------------------------------------------------
# Check timing closure
#------------------------------------------------------------------------------
set wns [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 \
                             -setup -sort_by slack]]
puts "=== WNS = ${wns} ns ==="
if { $wns >= 0 } {
    puts "=== TIMING CLOSED at ${clk_period_ns}ns ([expr {1000.0 / $clk_period_ns}] MHz) ==="
} else {
    puts "=== TIMING NOT MET — WNS = ${wns} ns ==="
}

#------------------------------------------------------------------------------
# Write checkpoint and summary
#------------------------------------------------------------------------------
set out_dir $project_dir/outputs
file mkdir $out_dir
write_checkpoint -force $out_dir/${top}_routed.dcp
write_verilog    -force -mode timesim $out_dir/${top}_timesim.v

puts "=== Done. Checkpoint: $out_dir/${top}_routed.dcp ==="
