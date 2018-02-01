
module Control_Unit
		(input 			reset, clk_2, 
		 input		[7:0]	instruction,
		 output reg		data_bus_buffer_enable, ALU_enable, ALU_operation, temp_register_enable, index_register_I_WE, instruction_register_WE,
		 output	reg	[1:0]	data_bus_buffer_path, accumulator_enable, index_register_IO,
		 output	reg	[3:0]	index_register_select, 
		 output	tri	[3:0]	data_bus);

		initial data_bus_buffer_path = 2'b00;
		initial data_bus_buffer_enable = 1'b0;

		assign data_bus = (4'b1101 == instruction[7:4]) ? instruction [3:0] : 4'bz;	
		
		always @(posedge clk_2, negedge reset)
			if (!reset) begin							//Reset
				data_bus_buffer_enable <= 1'b1;
				data_bus_buffer_path <= 2'bx;					
				ALU_enable <= 1'b0;
				ALU_operation <= 1'bx;
				accumulator_enable <= 2'b00;
				temp_register_enable <= 1'b0;
				index_register_IO <= 2'b10;
				index_register_I_WE <= 1'b0;
				instruction_register_WE <= 1'b0;				
			end
			else
				if (data_bus_buffer_enable) begin				//Make operation
					case (instruction[7:4])
						4'b1000: begin					//ADD Acc and Temp.Reg
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b1;
								ALU_operation <= 1'b0;
								accumulator_enable <= 2'b00;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b00;
								index_register_I_WE <= 1'b1;
								instruction_register_WE <= 1'b1;	
								index_register_select <= instruction [3:0];						
							 end
						4'b1001: begin					//SUB Acc and Temp.Reg
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b1;
								ALU_operation <= 1'b1;
								accumulator_enable <= 2'b00;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b00;
								index_register_I_WE <= 1'b1;	
								instruction_register_WE <= 1'b1;
								index_register_select <= instruction [3:0];				
							 end		
						4'b1010: begin					//Load to Acc from Reg
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable <= 2'b01;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b01;
								index_register_I_WE <= 1'b0;
								instruction_register_WE <= 1'b1;
								index_register_select <= instruction [3:0];	
							 end
						4'b1011: begin					//Unload to Reg from Acc
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable <= 2'b10;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b00;
								index_register_I_WE <= 1'b1;
								instruction_register_WE <= 1'b1;
								index_register_select <= instruction [3:0];	
							 end
						4'b1100: begin					//Load to Temp.Reg from Reg
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable <= 2'b00;
								temp_register_enable <= 1'b1;
								index_register_IO <= 2'b01;
								index_register_I_WE <= 1'b0;
								instruction_register_WE <= 1'b1;
								index_register_select <= instruction [3:0];	
							 end
						4'b1101: begin					//Load to Acc immediate
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable <= 2'b01;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b10;
								index_register_I_WE <= 1'b0;
								instruction_register_WE <= 1'b1;
							 end
						4'b0000: begin					//No operation
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b00;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable <= 2'b00;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b10;
								index_register_I_WE <= 1'b0;
								instruction_register_WE <= 1'b1;
							 end
						default: begin					//Default 
								data_bus_buffer_enable <= 1'b0;
								data_bus_buffer_path <= 2'b01;	
								ALU_enable <= 1'b0;
								ALU_operation <= 1'bx;
								accumulator_enable = 2'b00;
								temp_register_enable <= 1'b0;
								index_register_IO <= 2'b10;
								index_register_I_WE <= 1'b0;
								instruction_register_WE <= 1'b1;
							 end
					endcase
				end
				else begin							//Write to bus from buffer
					data_bus_buffer_enable <= 1'b1;
					data_bus_buffer_path <= 2'b01;					
					ALU_enable <= 1'b0;
					ALU_operation <= 1'bx;
					accumulator_enable <= 2'b00;
					temp_register_enable <= 1'b0;
					index_register_IO <= 2'b10;
					index_register_I_WE <= 1'b0;
					instruction_register_WE <= 1'b0;
				end

endmodule
