
module Test_AddingCPU;

	reg reset = 1, clk = 0;
	wire[5:0] adr_bus;
	wire rd_mem, wr_mem;
	wire[7:0] data_bus;
	
	reg [7:0] mem_data = 8'b0; // internal memory
	reg control = 0;
	
	integer HexFile, check;
	
	AddingCPU UUT(reset, clk, adr_bus, rd_mem, wr_mem, data_bus);
	
	always#10 clk = ~clk;
	
	initial
		begin
			Convert;
			HexFile = $fopen ("HexadecimalFile.mem", "r+");
			#25 reset = 1'b0;
			#405 $fclose (HexFile);
		$stop;
		end
		
	always@(posedge clk)
		begin : Memory_Read_Write
			control = 0;
			#1;
			if(rd_mem)
				begin
					#1;
					check = $fseek(HexFile, 4*adr_bus, 0);
					check = $fscanf(HexFile, "%h", mem_data);
					control = 1;
				end
			if(wr_mem)
				begin
					#1;
					check = $fseek(HexFile, 4*adr_bus, 0);
					$fwrite(HexFile, "%h", data_bus);
					$fflush(HexFile);
				end
		end
	assign data_bus = (control) ? mem_data: 8'hZZ;
		
	// . . .

	task Convert;
		begin: block
			reg [5:0] addr;
			reg [3*8:1] opCode;
			reg [7:0] data, writeData;
			reg JustData;
			integer i, HexFile, InstFile, check;
			
			HexFile = $fopen ("HexadecimalFile.mem");
			for(i=0; i<64; i=i+1) 
				$fwrite(HexFile, "00\n");  //... think
			$fflush(HexFile);			
			$fclose (HexFile);
			
			InstFile = $fopen("InstructionFile.mem", "r");
			HexFile = $fopen ("HexadecimalFile.mem", "r+");
			
			while ($fscanf(InstFile, "%h", addr) != -1) 
				begin
					check = $fseek(HexFile, addr*4, 0);
					check = $fgets(opCode, InstFile);
					JustData = 0;
					case (opCode)
					"lda": writeData[7: 6] = 2'b00;
					"sta": writeData[7: 6] = 2'b01;
					"jmp": writeData[7: 6] = 2'b10;
					"add": writeData[7: 6] = 2'b11;
					":::": 
						begin
							JustData = 1;
							check = $fscanf(InstFile, "%h", writeData);
						end
					default:
						begin
							JustData = 1;
							check = $fscanf(InstFile, "%h", writeData);
						end
					endcase
					
					if(JustData == 0) 
						begin
							check = $fscanf(InstFile, "%h", data);
							writeData[5:0] = data[5:0];
						end
					$fwrite(HexFile, "%h", writeData);
				end
			$fflush(HexFile);
			$fclose(HexFile);
			$fclose(InstFile);
		end
	endtask

endmodule
