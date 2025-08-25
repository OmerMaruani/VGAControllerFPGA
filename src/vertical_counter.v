

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module vertical_counter #(parameter vert_top_count = 525 ) (clk,rst_n,enable,vCount);
	input clk;
	input rst_n;
	input enable;

    output reg [9:0] vCount;
	
	
	reg [9:0] count = 0;

	always @(posedge clk or negedge rst_n) begin
	
		if(!rst_n) begin
			count <= 0;
		end
		else begin
			vCount <= count;
			if(enable) count <= count + 1;
			if(count == vert_top_count) count <= 0;
			
		end
		
	end

	
endmodule
	

