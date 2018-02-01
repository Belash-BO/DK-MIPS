
module rejim 	(input 	[1:0]	counter,
		input	[31:0]	count_in,
		input r, g,
		output reg	[4:0] red, green,
		output reg 	count_out,
		output reg	r_task, g_task);

		reg [2:0] register_red;
		reg [2:0] register_green;

		//reg [31:0]  count_in_wire_reg;
		
		always @(*) begin
			case (counter)
				0: 									//Rejim 1
					begin
						if (count_in == 25) begin
							if (register_red != 3) begin
								red = 0;
								red [register_red] = 1;
								register_red = register_red + 1;
							end
							else begin
								red = 0;
								red [register_red] = 1;
								register_red = 0;
							end
							if (register_green != 3) begin
								green = 0;
								green [register_green] = 1;
								register_green = register_green + 1;
							end
							else begin
								green = 0;
								green [register_green] = 1;
								register_green = 0;
							end
							count_out = 0;
						end
						else
							count_out = 1;
					end
				1: 									//Rejim 2
					begin
						if (count_in == 25) begin
							if (0 == r & 0 == g) begin
								r_task = 1;
								g_task = 0;
								count_out = 0;
							end
							else				
								if (1 == r)
									if (register_red != 4) 
										if (register_red != 0)begin
											red = 0;
											red [register_red] = 1;
											register_red = register_red - 1;
										end
										else begin
											red = 0;
											red [register_red] = 1;
											register_red = 4;
										end
									else 
										if (0 == g) begin
											red = 0;
											red [register_red] = 1;
											register_red = 3;
											g_task = 1;
											r_task = 0;
										end
								else
										red = 0;
								if (1 == g)
									if (register_green != 4) begin
										green = 0;
										green [register_green] = 1;
										register_green = register_green + 1;
									end
									else 
										if (0 == r) begin
											green = 0;
											green [register_green] = 1;
											register_green = 0; 		
											r_task = 1;
											g_task = 0;
										end
								else
										green = 0;
								count_out = 0;
						end
						else
							count_out = 1;
					end
				default: 								//Default
					begin
						red = 0;
						register_red = 0;
						green = 0;
						register_green = 0;
						count_out = 1;
					end
			endcase
		end
endmodule
