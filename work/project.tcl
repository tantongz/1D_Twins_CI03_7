set projDir "/home/ryan/twins/work/planAhead"
set projName "1D_Twins_CI03_7"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/ryan/twins/work/verilog/mojo_top_0.v" "/home/ryan/twins/work/verilog/matrix_display_1.v" "/home/ryan/twins/work/verilog/map_rom_2.v" "/home/ryan/twins/work/verilog/map_to_display_3.v" "/home/ryan/twins/work/verilog/matrix_decoder_4.v" "/home/ryan/twins/work/verilog/alu_main_5.v" "/home/ryan/twins/work/verilog/control_n_6.v" "/home/ryan/twins/work/verilog/reset_conditioner_7.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/edge_detector_8.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/button_conditioner_12.v" "/home/ryan/twins/work/verilog/multi_seven_seg_20.v" "/home/ryan/twins/work/verilog/counter_21.v" "/home/ryan/twins/work/verilog/counter_22.v" "/home/ryan/twins/work/verilog/counter_23.v" "/home/ryan/twins/work/verilog/alu_adder_24.v" "/home/ryan/twins/work/verilog/alu_cmp_25.v" "/home/ryan/twins/work/verilog/alu_boole_26.v" "/home/ryan/twins/work/verilog/alu_shift_27.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/pipeline_28.v" "/home/ryan/twins/work/verilog/counter_34.v" "/home/ryan/twins/work/verilog/digit_lut_35.v" "/home/ryan/twins/work/verilog/decoder_36.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/ryan/twins/constraint/buttons.ucf" "/home/ryan/twins/constraint/mojo.ucf" "/home/ryan/twins/constraint/matrix.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
