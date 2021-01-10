transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/ADD_SUB9.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/register_8bit.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/D_flipflop.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/control.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/Synchronizer.sv}
vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/toplevel.sv}

vlog -sv -work work +incdir+C:/Users/Administrator/Desktop/ECE385\ lab5\ final {C:/Users/Administrator/Desktop/ECE385 lab5 final/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 5000 ns
