
module Index_Register
		(input		[3:0]	index_register_select,
		 input		[1:0]	index_register_IO, 
		 input			index_register_I_WE, reset,
		 inout	tri	[3:0]	data_bus);
		 
	reg	[3:0] 	mem [0:15];
	reg		reg_IO, WE_out;
	reg	[3:0]	trigger;
				
	always @(*)
		if (!reset) begin
			mem [0] <= 4'b0010;
			mem [1] <= 4'b1100;
			mem [2] <= 4'b1111;
			mem [3] <= 4'b0001;
			mem [4] <= 4'b1010;
			mem [5] <= 4'b0101;
			mem [6] <= 4'b1011;
			mem [7] <= 4'b1001;
			mem [8] <= 4'b0110;
			mem [9] <= 4'b1111;
			mem [10] <= 4'b0011;
			mem [11] <= 4'b1100;
			mem [12] <= 4'b1001;
			mem [13] <= 4'b0011;
			mem [14] <= 4'b0101;
			mem [15] <= 4'b1111;
		end
		else			
			case (index_register_IO)
				2'b00: 
					begin	
						if (index_register_I_WE)
							mem [index_register_select] <= data_bus;
						reg_IO <= 0;
						WE_out <= 0;
					end			
				2'b01: 
					begin
						reg_IO <= 1;
						WE_out <= 1;
					end					
				2'b10: 
					begin
						reg_IO <= 0;
						WE_out <= 0;
					end
				default: 
					begin
						reg_IO <= 0;
						WE_out <= 0;
					end
			endcase 

	always @(*)
			if (WE_out)
				trigger <= mem [index_register_select];
			else
				trigger <= trigger;

	assign data_bus = (1 == reg_IO) ? trigger : 4'bz;

endmodule
