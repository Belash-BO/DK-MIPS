`timescale 1ns / 100ps

module girlanda_tb ();

	parameter period = 2500;	

	reg clk, button, reset; 
	wire [3:0] red, green;

girlanda girlanda_1 (.clk(clk), .button(button), .red(red), .green(green), .reset(reset));

	initial begin
		clk = 0;
		forever #(period/500) 
			clk = ~clk;
	end

	initial begin
		button = 1;
		#3000 button = 0;
		#250 button = 1;
		#6000 button = 0;
		#250 button = 1;
		#3000 button = 0;
		#250 button = 1;
		#3000 button = 0;
		#250 button = 1;
	end

	initial begin
		reset = 0;
		#15 reset = 1;
	end

	initial #20000 $stop;

endmodule
