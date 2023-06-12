onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/paddr
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/pwdata
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/pwrite
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/psel
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/penable
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/prdata
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/pready
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/pslverr
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/CLK
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/RSTN
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PADDR
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PWDATA
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PWRITE
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PSEL
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PENABLE
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PRDATA
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PREADY
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/PSLVERR
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/register_addr
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/data_slave
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/Wdata
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/enable_reg
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/write
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/OP1
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/OP2
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/OP_select
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/Result_Fpu
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/data_valid
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/FPU_enable
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/paddr
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/pwdata
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/pwrite
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/psel
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/penable
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/prdata
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/pready
add wave -noupdate /tb/top_i/peripherals_i/s_apb_bus/pslverr
add wave -noupdate /tb/top_i/peripherals_i/fpu_apb_i/slave1/PRDATA
add wave -noupdate /tb/top_i/peripherals_i/s_fpu_bus/prdata
add wave -noupdate {/tb/top_i/peripherals_i/periph_bus_i/s_masters[9]/prdata}
add wave -noupdate -expand /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/prdata
add wave -noupdate -expand /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/apb_node_i/prdata_i
add wave -noupdate /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/apb_node_i/prdata_i
add wave -noupdate /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/apb_node_i/prdata_o
add wave -noupdate /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/apb_node_i/psel_o
add wave -noupdate /tb/top_i/peripherals_i/periph_bus_i/apb_node_wrap_i/apb_node_i/penable_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61958719 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 376
configure wave -valuecolwidth 198
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {69783 ns} {209349 ns}
