`timescale 1ns / 100ps

module Data_Bus_Buffer_tb ();

	parameter period = 1;

	reg	[3:0]	D0_D3;
	reg		clk_2, data_bus_buffer_enable;
	reg	[1:0]	data_bus_buffer_path;
	wire	[3:0]	data_bus;
	reg	[3:0]	data_bus_input;

	integer i;

Data_Bus_Buffer Data_Bus_Buffer_1 (.D0_D3(D0_D3), .clk_2(clk_2), .data_bus_buffer_enable(data_bus_buffer_enable), .data_bus_buffer_path(data_bus_buffer_path), .data_bus(data_bus));

	initial begin
		clk_2 <= 1'b0;
		forever #(period) 
			clk_2 <= ~clk_2;
	end

	initial
		forever #(period)
			D0_D3 <= $random;

	initial begin
		data_bus_buffer_enable <= 1'b0;
		#20 data_bus_buffer_enable <= 1'b1;
	end

	initial 
		for (i = 0; i <= 3; i = i + 1)
			#4 data_bus_buffer_path <= i;

	initial #30 $stop;

endmodule
