

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module x_y_pixelGenerator #(parameter horz_visible_area = 640, parameter vert_visible_area = 480) (hCount,vCount,x_pixel,y_pixel,drawn_en);
    input [9:0] hCount;
	input [9:0] vCount;

	output reg [9:0] x_pixel;
	output reg [9:0] y_pixel;
	output reg drawn_en;
	

	
	always @* begin
		if(hCount < horz_visible_area ) x_pixel = hCount;
		else x_pixel = 0;
		
		if(vCount < vert_visible_area ) y_pixel = vCount;
		else y_pixel = 0;
		
		if( (hCount < horz_visible_area ) && ( vCount < vert_visible_area) ) drawn_en = 1;
		else drawn_en = 0;
		
	end

	
endmodule
	

