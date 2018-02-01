transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus_Labs/4004 {D:/Quartus_Labs/4004/Instruction_Register_and_Decoder.v}

vlog -vlog01compat -work work +incdir+D:/Quartus_Labs/4004 {D:/Quartus_Labs/4004/Instruction_Register_and_Decoder_TESTBENCH.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  Instruction_Register_and_Decoder_TESTBENCH

add wave *
view structure
view signals
run 1000 ns
