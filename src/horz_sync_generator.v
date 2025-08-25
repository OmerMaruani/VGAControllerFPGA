

`timescale 1ns / 1ps  // Define time scale in the Verilog file


module horz_sync_generator #(parameter sync_value = 640+16, parameter sync_duration = 96) (hCount,hSYNC);
    input [9:0] hCount;	
	output reg hSYNC;
	

	
	always @* begin
		if(hCount == 0) hSYNC = 1;
		else if(hCount == sync_value) hSYNC = 0;
		else if(hCount == sync_value + sync_duration) hSYNC = 1;
		
	end

	
endmodule
	

