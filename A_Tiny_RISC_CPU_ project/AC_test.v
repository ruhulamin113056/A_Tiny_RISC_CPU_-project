`timescale 1ns / 1ps


module AC_test;

	// Inputs
	reg [7:0] data_in;
	reg load;
	reg clk;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	AC uut (
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
		#10;
		data_in = 8'd34;
		load = 1;
		
		#10;
		data_in = 8'd34;
		load = 0;
		
		#10;
		data_in = 8'd16;
		load = 1;
        
		// Add stimulus here
		#100 $stop;
	end
      
	always #10 clk = ~clk;
      
endmodule

