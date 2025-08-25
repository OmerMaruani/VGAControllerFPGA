

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module clock25MGenerator #(parameter CLOCK_FREQ_M = 25 ) (clk,rst_n,out);
	input clk;
	input rst_n;
	output reg out;

	
	// Signals
	reg [1:0] count = 0;

	always @(posedge clk or negedge rst_n) begin
		
		if(!rst_n) begin
			count <= 0;
			out <= 0;
		end
		
		else begin
			out <= 0;
			count <= count + 1;
			if(count == 1) begin
				count <= 0;
				out <= 1;
			end
	
		end
	
	end

	
endmodule
	

