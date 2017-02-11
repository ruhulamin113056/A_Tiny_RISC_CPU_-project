
module AddingCPU 
	(
		input reset, clk, 
		output[5:0] adr_bus, 
		output rd_mem, wr_mem, 
		inout [7:0] data_bus
	);

	wire ir_on_adr, pc_on_adr, dbus_on_data, data_on_dbus,ld_ir,
		  ld_ac, ld_pc, inc_pc, clr_pc, pass, add, alu_on_dbus;
	wire[1:0] op_code;
	
	/*Controller cu ( reset, clk, op_code, rd_mem, wr_mem, ir_on_adr,
	pc_on_adr, dbus_on_data, data_on_dbus, ld_ir,
	ld_ac, ld_pc, inc_pc, clr_pc, pass,
	add, alu_on_dbus );*/
	
	Controller cu
	( 
		.reset(reset), .clk(clk), .op_code(op_code),
		.rd_mem(rd_mem), .wr_mem(wr_mem), .ir_on_adr(ir_on_adr),
		.pc_on_adr(pc_on_adr), .dbus_on_data(dbus_on_data),
		.data_on_dbus(data_on_dbus), .ld_ir(ld_ir), .ld_ac(ld_ac),
		.ld_pc(ld_pc), .inc_pc(inc_pc), .clr_pc(clr_pc),
		.pass(pass), .add(add), .alu_on_dbus(alu_on_dbus)
	);
	
	/*DataPath dp ( ir_on_adr, pc_on_adr, dbus_on_data, data_on_dbus,
	ld_ir, ld_ac, ld_pc, inc_pc, clr_pc, pass, add,
	alu_on_dbus, clk, adr_bus, op_code, data_bus );*/
	
	DataPath dp
	( 
		.ir_on_adr(ir_on_adr), .pc_on_adr(pc_on_adr), .dbus_on_data(dbus_on_data), 
		.data_on_dbus(data_on_dbus), .ld_ir(ld_ir), .ld_ac(ld_ac), .ld_pc(ld_pc), 
		.inc_pc(inc_pc), .clr_pc(clr_pc), .pass(pass), .add(add), .alu_on_dbus(alu_on_dbus), .clk(clk),
		.adr_bus(adr_bus), .op_code(op_code), .data_bus(data_bus) 
	);

endmodule
