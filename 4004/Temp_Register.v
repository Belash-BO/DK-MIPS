
module Temp_Register
			(input tri		[3:0]	data_bus,
			 input			temp_register_enable, 
			 output	reg	[3:0]	B);
			 
			 reg	[3:0]	R;	 
			 
		always @(*)
			if (temp_register_enable)
				R <= data_bus;
			else 
				R <= R;
			
		always @(*) 
				B <= R;

endmodule	
