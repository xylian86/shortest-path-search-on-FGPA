transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/ece385/lab/lab4/ece385sp16_lab4_adders {D:/ece385/lab/lab4/ece385sp16_lab4_adders/ripple_adder.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab4/ece385sp16_lab4_adders {D:/ece385/lab/lab4/ece385sp16_lab4_adders/HexDriver.sv}
vlog -sv -work work +incdir+D:/ece385/lab/lab4/ece385sp16_lab4_adders {D:/ece385/lab/lab4/ece385sp16_lab4_adders/lab4_adders_toplevel.sv}

