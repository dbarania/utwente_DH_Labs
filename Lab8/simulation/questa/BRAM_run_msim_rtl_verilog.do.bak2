transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8 {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/BRAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8 {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/FIFO_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8 {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/Bin2Seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8/output_files {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/output_files/WriteRequets.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8 {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/ReadRequets.v}

vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab8 {C:/Users/damia/Studia/DigitalHardwareUT/Lab8/BRAM_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  BRAM_tb

add wave *
view structure
view signals
run -all
