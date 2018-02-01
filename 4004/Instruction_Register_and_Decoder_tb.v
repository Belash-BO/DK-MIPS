`timescale 1ns / 100ps 

module Instruction_Register_and_Decoder_tb ();
	
	parameter period = 2;

	reg	[3:0]	data_bus;
	reg		clk_1, clk_2, instruction_register_WE;
	wire	[7:0]	instruction_decoder;

Instruction_Register_and_Decoder Instruction_Register_and_Decoder_1 (.data_bus(data_bus), .clk_1(clk_1), .clk_2(clk_2), .instruction_register_WE(instruction_register_WE), .instruction_decoder(instruction_decoder));

	initial begin
		clk_1 <= 1'b0;
		forever #(period/2)
			clk_1 <= ~clk_1;
	end

	initial begin
		clk_2 <= 1'b0;
		forever #(period)
			clk_2 <= ~clk_2;
	end

	initial 
		forever #(period)
			data_bus <= $random;

	initial begin
		instruction_register_WE <= 1'b0;
		#30 instruction_register_WE <= 1'b1;
		#5 instruction_register_WE <= 1'b0;
	end

	initial #40 $stop;

endmodule
