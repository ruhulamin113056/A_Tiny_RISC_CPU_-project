`timescale 1ns / 1ps


module IR_test;

	// Inputs
	reg [7:0] data_in;
	reg load;
	reg clk;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	IR uut (
		.data_in(data_in), 
		.load(load), 
		.clk(clk), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		load = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

