

`timescale 1ns / 1ps  // Define time scale in the Verilog file
`define CLK_PER 1



module vga_controller_tb;



	// Declare testbench signals (inputs and outputs)
	reg clk;
	reg rst_n;
	wire hSYNCPulse;
	wire vSYNCPulse;
	wire [2:0] R;
	wire [2:0] G;
	wire [1:0] B;
	
	
	vga_controller UUT (.clk(clk),.rst_n(rst_n),.hSYNCPulse(hSYNCPulse),.vSYNCPulse(vSYNCPulse),.R(R),.G(G),.B(B) );


	

	
	
	
	
	
	// Stimulus generation: Apply test vectors
	initial begin
		
		
		// Initialiaze the signal
		clk = 0;
		rst_n = 1;
		
	
	
	
		// Display headers for simulation outputs
		$display("Time\t clk\t rst_n\t en\t out\t");
		
		// Monitor every change of the signals
        //$monitor("Time = %0t, rate = %b, out= %b", $time,rate, out);



	

		// Apply input combinations
		#10; rst_n = 0;
		#10; rst_n = 1;
		
		
		
		
		
		
	end
	
	
	always begin
		#(`CLK_PER) clk = ~clk;
	end
		
	
		
	
endmodule