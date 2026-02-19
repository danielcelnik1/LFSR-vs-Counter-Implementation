#********************************************************************** 
#			LFSR	 
#********************************************************************** 
#Project 2
#*******************************************************************

read_sverilog  {lfsr.sv}

link
list_designs  -show_file
printvar current_design
check_design

create_clock clk -period 10


set_drive 1 [all_inputs]
# set drive strength on signals connected to outputs  
set_load 2 [all_outputs]
# set max allowable delays  


set_input_delay -max 2 -clock clk [all_inputs ]
set_output_delay -max 2 -clock clk  [all_outputs]


set auto_wire_load_selection true

# set max area allowed  
max_area 200

# this compiles (synthesizes) the verilog file  
compile
# if compile procedes with no errors then create reports  

report -area > lfsr_area_report.txt
report -timing > lfsr_timing_report.txt


# write netlist  files for simulation and for layout  
change_names -rules verilog -hierarchy
write_file -format verilog -hierarchy -output "lfsr_net.v"

check_design


