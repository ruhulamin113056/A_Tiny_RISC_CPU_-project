`timescale 1ns / 1ps


module DataPath_test;

	// Inputs
	reg ir_on_adr;
	reg pc_on_adr;
	reg dbus_on_data;
	reg data_on_dbus;
	reg ld_ir;
	reg ld_ac;
	reg ld_pc;
	reg inc_pc;
	reg clr_pc;
	reg pass;
	reg add;
	reg alu_on_dbus;
	reg clk;

	// Outputs
	wire [5:0] adr_bus;
	wire [1:0] op_code;

	// Bidirs
	wire [7:0] data_bus;

	// Instantiate the Unit Under Test (UUT)
	DataPath uut (
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
		.alu_on_dbus(alu_on_dbus), 
		.clk(clk), 
		.adr_bus(adr_bus), 
		.op_code(op_code), 
		.data_bus(data_bus)
	);

	initial begin
		// Initialize Inputs
		ir_on_adr = 0;
		pc_on_adr = 0;
		dbus_on_data = 0;
		data_on_dbus = 0;
		ld_ir = 0;
		ld_ac = 0;
		ld_pc = 0;
		inc_pc = 0;
		clr_pc = 0;
		pass = 0;
		add = 0;
		alu_on_dbus = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

