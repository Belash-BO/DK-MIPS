`timescale 1ns / 100ps

module Index_Register_tb ();	

	reg	[3:0]	index_register_select;
	reg	[1:0]	index_register_IO;
	reg		index_register_I_WE;
	wire	[3:0]	data_bus, data_bus_output;
	reg	[3:0]	data_bus_input;

	integer i, j;

Index_Register Index_Register_1 (.index_register_select(index_register_select), .index_register_IO(index_register_IO), .index_register_I_WE(index_register_I_WE), .data_bus(data_bus));

	assign data_bus_output = data_bus;

	assign data_bus = (2'b00 == index_register_IO) ? data_bus_input : 4'bz;

	initial begin
		index_register_I_WE <= 1'b1;
		#60 index_register_I_WE <= 1'b0;
	end

	initial begin
		index_register_IO <= 2'b00;
		#15 index_register_IO <= 2'b01;
		#15 index_register_IO <= 2'b10;
		#15 index_register_IO <= 2'b11;
		#15 index_register_IO <= $random;
	end
	
	initial begin
		for (i = 0; i <= 16; i = i + 1)
			#1 index_register_select <= i;
		for (i = 0; i <= 16; i = i + 1)
			#1 index_register_select <= i;	
	end

	initial begin
		for (j = 0; j <= 16; j = j +1)
			#1 data_bus_input <= j;
		data_bus_input <= 4'bz;
	end

	initial #70 $stop;

endmodule
