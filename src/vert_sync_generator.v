

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module vert_sync_generator #(parameter sync_value = 480+10, parameter sync_duration = 2) (vCount,vSYNC);
    input [9:0] vCount;
	
	output reg vSYNC;
	

	
	always @* begin
		if(vCount == 0) vSYNC = 1;
		else if(vCount == sync_value) vSYNC = 0;
		else if(vCount == sync_value + sync_duration) vSYNC = 1;
		
	end

	
endmodule
	

