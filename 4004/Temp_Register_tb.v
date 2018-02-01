`timescale 1ns / 100ps

module Temp_Register_tb ();

	parameter period = 1;

	reg	[3:0]	data_bus;
	reg		temp_register_enable;
	wire	[3:0]	B;

Temp_Register Temp_Register_1 (.data_bus(data_bus), .temp_register_enable(temp_register_enable), .B(B));

	initial begin
		temp_register_enable <= 1'b1;
		#10 temp_register_enable <= 1'b0;
	end

	initial 
		forever #(period)
			data_bus <= $random;

	initial #15 $stop;

endmodule
