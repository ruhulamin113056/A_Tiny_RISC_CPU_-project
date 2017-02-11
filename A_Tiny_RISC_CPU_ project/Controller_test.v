`timescale 1ns / 1ps


module Controller_test;

	// Inputs
	reg reset;
	reg clk;
	reg [1:0] op_code;

	// Outputs
	wire rd_mem;
	wire wr_mem;
	wire ir_on_adr;
	wire pc_on_adr;
	wire dbus_on_data;
	wire data_on_dbus;
	wire ld_ir;
	wire ld_ac;
	wire ld_pc;
	wire inc_pc;
	wire clr_pc;
	wire pass;
	wire add;
	wire alu_on_dbus;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.reset(reset), 
		.clk(clk), 
		.op_code(op_code), 
		.rd_mem(rd_mem), 
		.wr_mem(wr_mem), 
		.ir_on_adr(ir_on_adr), 
		.pc_on_adr(pc_on_adr), 
		.dbus_on_data(dbus_on_data), 
		.data_on_dbus(data_on_dbus), 
		.ld_ir(ld_ir), 
		.ld_ac(ld_ac), 
		.ld_pc(ld_pc), 
		.inc_pc(inc_pc), 
		.clr_pc(clr_pc), 
		.pass(pass), 
		.add(add), 
		.alu_on_dbus(alu_on_dbus)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		op_code = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

