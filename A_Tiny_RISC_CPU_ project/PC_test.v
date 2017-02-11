`timescale 1ns / 1ps


module PC_test;

	// Inputs
	reg [5:0] data_in;
	reg load;
	reg inc;
	reg clr;
	reg clk;

	// Outputs
	wire [5:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.data_in(data_in), 
		.load(load), 
		.inc(inc), 
		.clr(clr), 
		.clk(clk), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		load = 0;
		inc = 0;
		clr = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

