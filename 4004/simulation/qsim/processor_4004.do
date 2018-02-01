onerror {quit -f}
vlib work
vlog -work work 4004.vo
vlog -work work processor_4004.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.processor_4004_vlg_vec_tst
vcd file -direction processor_4004.msim.vcd
vcd add -internal processor_4004_vlg_vec_tst/*
vcd add -internal processor_4004_vlg_vec_tst/i1/*
add wave /*
run -all
