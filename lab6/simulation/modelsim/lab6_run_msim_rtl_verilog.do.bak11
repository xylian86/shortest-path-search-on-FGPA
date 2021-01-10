transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/ISDU.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/HexDriver.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/tristate.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/test_memory.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/SLC3_2.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/Mem2IO.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/ALU.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/MUX.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/datapath.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/reg_file.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/BEN.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/Synchronizers.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/slc3.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/memory_contents.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/lab6_toplevel.sv}

vlog -sv -work work +incdir+D:/ece385/lab/lab6/ECE385LAB6WEEK2 {D:/ece385/lab/lab6/ECE385LAB6WEEK2/testbench_week2.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench_week2

add wave *
view structure
view signals
run 280 us
