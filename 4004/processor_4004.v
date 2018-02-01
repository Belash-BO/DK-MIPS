
module processor_4004 
		(input			reset, clk_1, clk_2,
		 input		[3:0]	D0_D3,
		 output			carry_out,
		 output	tri	[3:0]	data_bus);

		 wire 		[7:0]	instruction;
		 wire			data_bus_buffer_enable, ALU_enable, ALU_operation, temp_register_enable, index_register_I_WE, instruction_register_WE;
		 wire 		[1:0]	data_bus_buffer_path, accumulator_enable, index_register_IO;
		 wire		[3:0]	A, B, index_register_select; 

Control_Unit Control_Unit_1 (.reset(reset), .clk_2(clk_2), .instruction(instruction), .data_bus_buffer_enable(data_bus_buffer_enable), .data_bus_buffer_path(data_bus_buffer_path), .ALU_enable(ALU_enable), .ALU_operation(ALU_operation), .accumulator_enable(accumulator_enable), .temp_register_enable(temp_register_enable), .index_register_IO(index_register_IO), .index_register_I_WE(index_register_I_WE), .instruction_register_WE(instruction_register_WE),.index_register_select(index_register_select), .data_bus(data_bus));

Data_Bus_Buffer Data_Bus_Buffer_1 (.D0_D3(D0_D3), .clk_2(clk_2), .data_bus_buffer_enable(data_bus_buffer_enable), .data_bus_buffer_path(data_bus_buffer_path), .data_bus(data_bus));

ALU ALU_1 (.A(A), .B(B), .ALU_enable(ALU_enable), .ALU_operation(ALU_operation), .data_bus(data_bus), .carry_out(carry_out)); 

Accumulator Accumulator_1 (.data_bus(data_bus), .accumulator_enable(accumulator_enable), .A(A));

Temp_Register Temp_Register_1 (.data_bus(data_bus), .temp_register_enable(temp_register_enable), .B(B));

Index_Register Index_Register_1 (.index_register_select(index_register_select), .index_register_IO(index_register_IO), .index_register_I_WE(index_register_I_WE), .data_bus(data_bus), .reset(reset));

Instruction_Register_and_Decoder Instruction_Register_and_Decoder_1 (.data_bus(data_bus), .clk_1(clk_1), .clk_2(clk_2), .instruction_register_WE(instruction_register_WE), .instruction_decoder(instruction));
	 
endmodule
				 
