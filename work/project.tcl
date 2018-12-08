set projDir "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/planAhead"
set projName "1D_Twins_CI03_7"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/mojo_top_0.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/matrix_display_1.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/map_rom_2.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/map_to_display_3.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/matrix_decoder_4.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/alu_main_5.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/control_n_6.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/reset_conditioner_7.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/edge_detector_8.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/button_conditioner_12.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/multi_seven_seg_20.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/counter_21.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/alu_adder_22.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/alu_cmp_23.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/alu_boole_24.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/alu_shift_25.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/pipeline_26.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/counter_32.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/digit_lut_33.v" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/work/verilog/decoder_34.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/constraint/matrix.ucf" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/constraint/buttons.ucf" "C:/Users/ZhiYao/Documents/GitHub/1D_Twins_CI03_7/constraint/mojo.ucf"]
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
