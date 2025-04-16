set projDir "./vivado"
set projName "lab3_test"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "./source/alchitry_top.sv" "./source/reset_conditioner.sv" "./source/alu.sv" "./source/adder.sv" "./source/adder_fa.sv" "./source/adder_rca.sv" "./source/twos_complement.sv" "./source/alu_manual_tester.sv" "./source/boolean.sv" "./source/boolean_mux_4.sv" "./source/compare.sv" "./source/compare_mux_4.sv" "./source/multiplier.sv" "./source/shifter.sv" "./source/shifter_ArithBitR.sv" "./source/shifter_BitL.sv" "./source/shifter_BitR.sv" "./source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "./constraint/alchitry.xdc" "./constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
