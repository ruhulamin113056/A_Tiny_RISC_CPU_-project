`timescale 1ns / 1ps


module ALU_test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg pass;
	reg add;

	// Outputs
	wire [7:0] alu_out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.pass(pass), 
		.add(add), 
		.alu_out(alu_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		pass = 0;
		add = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

