`timescale 1ns / 100ps

module processor_4004_tb ();

	parameter period = 2;

	reg		reset, clk_1, clk_2;
	reg	[3:0]	D0_D3;
	wire		carry_out;
	tri	[3:0]	data_bus;

processor_4004 processor_4004_1 (.reset(reset), .clk_1(clk_1), .clk_2(clk_2), .D0_D3(D0_D3), .carry_out(carry_out), .data_bus(data_bus));

	initial begin
		clk_1 = 1'b0;
		forever #(period/2)
			clk_1 = ~clk_1;
	end

	initial begin
		clk_2 = 1'b0;
		#1 clk_2 = 1'b0;
		forever #(period)
			clk_2 = ~clk_2;
	end

	initial begin
		D0_D3 = 4'b1000;
		#2 D0_D3 = 4'b1000;
		#2 D0_D3 = $random;

		#4 D0_D3 = 4'b1001;
		#2 D0_D3 = $random;

		#4 D0_D3 = 4'b1010;
		#2 D0_D3 = $random;

		#4 D0_D3 = 4'b1011;
		#2 D0_D3 = $random;	

		#4 D0_D3 = 4'b1100;
		#2 D0_D3 = $random;

		#4 D0_D3 = 4'b1101;
		#2 D0_D3 = $random;

		#4 D0_D3 = 4'b0000;
		#2 D0_D3 = $random;
	end

	initial begin
		reset = 1'b0;
		#1 reset = 1'b1;
	end

	initial #60 $stop;

endmodule
	
