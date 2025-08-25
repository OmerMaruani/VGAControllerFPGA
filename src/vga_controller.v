

`timescale 1ns / 1ps  // Define time scale in the Verilog file

`define PULSE_PER_CLOCKS 2  // Define the constant value


module vga_controller (clk,rst_n,hSYNCPulse,vSYNCPulse,R,G,B);
	input clk;
	input rst_n;
	output hSYNCPulse;
	output vSYNCPulse;
	output [2:0] R;
	output [2:0] G;
	output [1:0] B;
	
	
	

	// Wires for various components
	wire clock_25M;
	wire end_of_line;
	wire [9:0] hCount_signal;
	wire [9:0] vCount_signal;
	wire [9:0] x_pixel_signal;
	wire [9:0] y_pixel_signal;
	wire drawn_en_signal;
	wire [7:0] data_signal;


	// Parameters
	parameter HORZ_TOTAL		= 800;
	parameter VERT_TOTAL		= 525;
	parameter HORZ_SYNC_START	= 640 + 16;
	parameter HORZ_SYNC_WIDTH	= 96;
	parameter VERT_SYNC_START	= 480+10;
	parameter VERT_SYNC_WIDTH	= 2;
	parameter RGB_WIDTH 		= 8;
	parameter ADDRESS_WIDTH		= 18;
	
	
	 


	// Instantiate 
	clock25MGenerator #(25) clock25M (.clk(clk),.rst_n(rst_n),.out(clock_25M) );
	horizontal_counter #(HORZ_TOTAL) horzCounter (.clk(clock_25M),.rst_n(rst_n),.hCount(hCount_signal),.end_of_line(end_of_line));
	vertical_counter #(VERT_TOTAL) vertCounter (.clk(clock_25M),.rst_n(rst_n),.enable(end_of_line),.vCount(vCount_signal));
	horz_sync_generator #(HORZ_SYNC_START,HORZ_SYNC_WIDTH) horzSYNC (.hCount(hCount_signal),.hSYNC(hSYNCPulse));
	vert_sync_generator #(VERT_SYNC_START,VERT_SYNC_WIDTH) vertSYNC(.vCount(vCount_signal),.vSYNC(vSYNCPulse));


	// Calculate pixel coordinates and drawing enable
	x_y_pixelGenerator #(640,480) x_y_pixels (.hCount(hCount_signal),.vCount(vCount_signal),
												.x_pixel(x_pixel_signal),.y_pixel(y_pixel_signal),.drawn_en(drawn_en_signal));
									
											
	// Store the pixel data
	rom #(RGB_WIDTH,ADDRESS_WIDTH,640) rom_initdata (.clk(clock_25M),.rst_n(rst_n),.x_pixel(x_pixel_signal),.y_pixel(y_pixel_signal),
									.drawn_en(drawn_en_signal), .data(data_signal)	);
													
		
		


	
	
	
	// Assign RGB Values from the rom output
	assign R = data_signal[7:5]; // R = 3'b111;
	assign G = data_signal[4:2]; // G = 3'b111; 
	assign B = data_signal[1:0]; // B = 2'b11; 
										
												


	

	

	
endmodule
	


