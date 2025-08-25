

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module horizontal_counter #(parameter horz_top_count = 800 ) (clk,rst_n,hCount,end_of_line);
	input clk;
	input rst_n;
    output reg [9:0] hCount;
	output reg end_of_line;
	
	
	
	reg [9:0] count = 0;

	always @(posedge clk or negedge rst_n) begin
		
		if(!rst_n) begin
			count <= 0;
		end
		
		
		else begin
			count <= count + 1;
			hCount <= count;
			end_of_line <= 0; 
			if(count == horz_top_count) begin
				count <= 0;
				end_of_line <= 1;
			end
		
		
		end
	
	end

	
endmodule
	

