
module Data_Bus_Buffer	(input		[3:0]	D0_D3,
			 input			clk_2, data_bus_buffer_enable,
			 input		[1:0]	data_bus_buffer_path,
			 inout	tri	[3:0]	data_bus);
								 
			 reg	[3:0]	buffer, trigger;
			 reg		reg_IO, WE_out;
			

	

	always @(posedge clk_2) 
		if (!data_bus_buffer_enable) 
			case (data_bus_buffer_path)
				2'b00: 
					begin
						buffer <= D0_D3;
						reg_IO <= 0;
						WE_out <= 0;
					end
				2'b01: 
					begin
						reg_IO <= 1;
						WE_out <= 1;
					end	
				//2'b10: D0_D3 <= buffer;
				2'b11: 
					begin
						buffer <= data_bus;
						reg_IO <= 0;
						WE_out <= 0;
					end
				default: 
					begin
						buffer <= buffer;	
						reg_IO <= 0;
						WE_out <= 0;
					end
			endcase		
		else 
			buffer <= D0_D3;

	always @(WE_out)
			if (WE_out)
				trigger <= buffer;
			else
				trigger <= trigger;
	
	assign data_bus = (1 == reg_IO) ? trigger : 4'bz;

endmodule
	
