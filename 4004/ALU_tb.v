`timescale 1ns / 100ps

	module ALU_tb ();

	parameter period = 1;

	reg	[3:0]	A, B;
	reg		ALU_operation, ALU_enable;
	tri	[3:0]	data_bus;	
	wire		carry_out;

ALU ALU_1 (.A(A), .B(B), .ALU_operation(ALU_operation), .ALU_enable(ALU_enable), .data_bus(data_bus), .carry_out(carry_out));

	initial begin
		A <= 4'b0;
		#1 A <= 4'b1111;
		#1 forever #(period) 
			A <= $random;
	end

	initial begin
		B <= 0;
		#1 B <= 4'b1111;
		#1 forever #(period) 
			B <= $random;
	end

	initial begin
		ALU_enable <= 1;
		#90 ALU_enable <= 0;
	end

	initial begin
		ALU_operation <= 0;
		#45 ALU_operation <= 1;
	end

	initial #100 $stop;

endmodule		
