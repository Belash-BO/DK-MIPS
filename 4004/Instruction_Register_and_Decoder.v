
module Instruction_Register_and_Decoder
			(input		[3:0]	data_bus,
			 input			clk_1, clk_2, instruction_register_WE,
			 output	reg	[7:0]	instruction_decoder);
			 
		reg	[7:0]	instruction_register;
		
		reg k = 1'b0;
		
			
	always @(posedge clk_1)
		if (!instruction_register_WE)
			if (!k) begin
				instruction_register [3:0] <= data_bus;
				k <= 1'b1;
			end
			else	begin
				instruction_register [7:4] <= data_bus;
				k <= 1'b0;
			end
		else
			instruction_register <= instruction_register;	
	
	always @(posedge clk_2)
		instruction_decoder <= instruction_register;
			
endmodule
