`timescale 1ns / 100ps

module Control_Unit_tb ();

	parameter period = 1;

	reg		reset, clk_2;
	reg	[7:0]	instruction;
	wire		data_bus_buffer_enable, ALU_enable, ALU_operation, temp_register_enable, index_register_I_WE, instruction_register_WE;
	wire	[1:0]	data_bus_buffer_path, accumulator_enable, index_register_IO;
	wire	[3:0]	index_register_select, data_bus;	

Control_Unit Control_Unit_1 (.reset(reset), .clk_2(clk_2), .instruction(instruction), .data_bus_buffer_enable(data_bus_buffer_enable), .ALU_enable		(ALU_enable), .ALU_operation(ALU_operation), .temp_register_enable(temp_register_enable), .index_register_I_WE(index_register_I_WE), .instruction_register_WE(instruction_register_WE), .data_bus_buffer_path(data_bus_buffer_path), .accumulator_enable(accumulator_enable), .index_register_IO(index_register_IO), .index_register_select(index_register_select), .data_bus(data_bus));

	initial begin
		clk_2 <= 0;
		forever #(period)
			clk_2 <= ~clk_2;
	end

	initial begin
		instruction [7:4] <= 4'b0;
		#2 instruction [7:4] <= 4'b1000;
		#10 instruction [7:4] <= 4'b1001;
		#10 instruction [7:4] <= 4'b1010;
		#10 instruction [7:4] <= 4'b1011;
		#10 instruction [7:4] <= 4'b1100;
		#10 instruction [7:4] <= 4'b1101;
		#10 instruction [7:4] <= 4'b0000;
	end

	initial 
		forever #(period)
			instruction [3:0] <= $random;

	initial begin
		reset <= 1'b1;
		#70 reset <= 1'b0;
	end

	initial #100 $stop;

endmodule

