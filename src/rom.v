

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module rom #(parameter DATA_WIDTH = 8, parameter ADDS_WIDTH = 18, horz_visible_area = 640 ) (clk,rst_n,x_pixel,y_pixel,drawn_en,data);
	input clk;
	input rst_n;
	input [9:0] x_pixel;
	input [9:0] y_pixel;
	input drawn_en ;

	output reg [DATA_WIDTH-1:0] data;
	
	
	
	
	reg [ADDS_WIDTH-1:0] address;
	
	
	//*****Change to real location******

	// Read data for real hardware synthesis
	(* ram_init_file = "../sim/bitmap/many_photos.mif" *)  // <-- Add this attribute
	reg [DATA_WIDTH-1:0] mem [0: ( 1 << ADDS_WIDTH ) - 1 ];
	


	// Read data from a file (e.g., "bitmap.txt") simulation only
	/*
    initial begin
		// Use $readmemb for reading binary values
        $readmemh("../sim/bitmap/BirdImageLinesSeparated.txt", mem); 
	end
	*/	
	
	
	
	always @(posedge clk or negedge rst_n) begin
	
		if (!rst_n) begin
			address <= 0;
			data <= 0;
		end
		
		else if( drawn_en ) begin
		
		
			// 320x240 Resolution
			
			/*
			if( x_pixel < 320 && y_pixel < 240 ) begin
				address <= x_pixel + (y_pixel *320);
			end
			else begin
				address <= 0;
			end
			
			data = mem[address];
			*/
			
		
			// 640x480
			
			
		
			address <= (y_pixel >> 1) * 320 + (x_pixel >> 1);	// Image 320x240
			
			//address <= (y_pixel) * 640 + (x_pixel);	// Image 640x480			
			data <= mem[address];
			
			
			
		end
		
		
		
		
	end
	
endmodule
	

