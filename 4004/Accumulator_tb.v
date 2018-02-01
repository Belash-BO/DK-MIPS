`timescale 1ns / 100ps 

module Accumulator_tb ();

	parameter period = 1;

	wire	[3:0]	data_bus;
	reg	[3:0]	data_bus_input;
	reg	[1:0]	accumulator_enable;
	wire	[3:0]	A;
	
	integer i;

Accumulator Accumulator_1 (.data_bus(data_bus), .accumulator_enable(accumulator_enable), .A(A));

	assign data_bus = (2'b01 == accumulator_enable) ? data_bus_input : 4'bz;

	initial begin
		for (i = 0; i <= 3; i = i + 1)	
			#5 accumulator_enable <= i;
		#5 accumulator_enable <= 0;
	end

	initial begin
		data_bus_input <= 0;
		forever #(period)
			 data_bus_input <= $random;
	end

	initial #30 $stop;

endmodule		
