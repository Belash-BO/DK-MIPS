
module ALU	(input 		[3:0]	A, B, 
		 input			ALU_operation, ALU_enable,
		 output	tri	[3:0]	data_bus,
		 output	reg		carry_out);
				
		 reg	[4:0]	carry_result;
		
	always @(ALU_operation, A, B) 
		if (!ALU_operation) 
			carry_result <= A + B;
		else
			carry_result <= A + ~B + ALU_operation;

	assign data_bus = (ALU_enable) ? carry_result [3:0] : 4'bz;
	

	always @(ALU_enable, carry_result) 
		if (ALU_enable)
			carry_out <= carry_result [4];	
		else
			carry_out <= 1'b0;	

endmodule
