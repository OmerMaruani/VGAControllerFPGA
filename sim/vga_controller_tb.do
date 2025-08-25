
vlog ../src/clock25MGenerator.v
vlog ../src/horizontal_counter.v
vlog ../src/vertical_counter.v
vlog ../src/horz_sync_generator.v
vlog ../src/vert_sync_generator.v
vlog ../src/x_y_pixelGenerator.v
vlog ../src/rom.v


vlog ../src/vga_controller.v
vlog ../src/vga_controller_tb.v


vsim vga_controller_tb

add wave -group my_first_group 		vga_controller_tb/*
add wave -group UUT 				vga_controller_tb/UUT/*
add wave -group clock25MGenerator 	vga_controller_tb/UUT/clock25M/*
add wave -group horizontal_counter 	vga_controller_tb/UUT/horzCounter/*
add wave -group vertical_counter 	vga_controller_tb/UUT/vertCounter/*
add wave -group horzSYNC 			vga_controller_tb/UUT/horzSYNC/*
add wave -group vertSYNC 			vga_controller_tb/UUT/vertSYNC/*

add wave -group x_y_pixelGenerator 	vga_controller_tb/UUT/x_y_pixels/*
add wave -group rom 				vga_controller_tb/UUT/rom_initdata/*





config wave -signalnamewidth 1
radix binary


# Change the radix for specific signals

# UUT
radix signal sim:/vga_controller_tb/UUT/hCount_signal unsigned
radix signal sim:/vga_controller_tb/UUT/vCount_signal unsigned
radix signal sim:/vga_controller_tb/UUT/x_pixel_signal unsigned
radix signal sim:/vga_controller_tb/UUT/y_pixel_signal unsigned



radix signal sim:/vga_controller_tb/UUT/horzCounter/hCount unsigned
radix signal sim:/vga_controller_tb/UUT/horzCounter/count unsigned


radix signal sim:/vga_controller_tb/UUT/vertCounter/vCount unsigned
radix signal sim:/vga_controller_tb/UUT/vertCounter/count unsigned

radix signal sim:/vga_controller_tb/UUT/x_y_pixels/hCount unsigned
radix signal sim:/vga_controller_tb/UUT/x_y_pixels/vCount unsigned
radix signal sim:/vga_controller_tb/UUT/x_y_pixels/x_pixel unsigned
radix signal sim:/vga_controller_tb/UUT/x_y_pixels/y_pixel unsigned


radix signal sim:/vga_controller_tb/UUT/rom_initdata/y_pixel unsigned
radix signal sim:/vga_controller_tb/UUT/rom_initdata/y_pixel unsigned
radix signal sim:/vga_controller_tb/UUT/rom_initdata/address unsigned




# Add a signal
#add wave sim:/vga_controller_tb/UUT/main_controller_dut/matrix_elements/mem_array
#for {set i 0} {$i < 32} {incr i} {
#    radix signal /vga_controller_tb/UUT/main_controller_dut/matrix_elements/mem_array($i) hex
#}

#add wave sim:/main_controller_tb/main_controller_dut/matrix_elements/mem_array[0]
#radix signal sim:/main_controller_tb/main_controller_dut/matrix_elements/mem_array[0] hex


restart -f
run 1000ns
#run 1000ms