transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab7 {C:/Users/damia/Studia/DigitalHardwareUT/Lab7/FIFO_Wrapper.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab7 {C:/Users/damia/Studia/DigitalHardwareUT/Lab7/FIFO.v}
vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab7 {C:/Users/damia/Studia/DigitalHardwareUT/Lab7/BinTo7Seg.v}

vlog -vlog01compat -work work +incdir+C:/Users/damia/Studia/DigitalHardwareUT/Lab7 {C:/Users/damia/Studia/DigitalHardwareUT/Lab7/FIFO_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  FIFO_tb

add wave *
view structure
view signals
run -all
