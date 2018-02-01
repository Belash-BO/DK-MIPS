
module Accumulator
			(inout		[3:0]	data_bus,
			 input		[1:0]	accumulator_enable, 
			 output	reg	[3:0]	A);
			 
			 reg	[3:0]	R, trigger = 0;	
			 reg		reg_IO, WE_out; 
	
		
			 
		always @(*)
			case (accumulator_enable)
				2'b00: 
					begin
						reg_IO <= 0;
						WE_out <= 0;
						R <= R;
					end
				2'b01: 
					begin
						reg_IO <= 0;
						WE_out <= 0;
						R <= data_bus;
					end
				2'b10: 
					begin
						reg_IO <= 1;
						WE_out <= 1;
					end
				default: 
					begin
						reg_IO <= 0;
						WE_out <= 0;
						R <= R;
					end
			endcase
			
		always @(*) 
				A <= R;

		always @(WE_out)
			if (WE_out)
				trigger <= R;
			else
				trigger <= trigger;

		assign data_bus = (reg_IO) ? trigger : 4'bz;

endmodule	
