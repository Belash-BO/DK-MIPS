
module girlanda	(input clk, button, reset,
		 output [4:0] red, green);
					  
	reg [1:0] counter;
	//wire [1:0] counter_wire;
	integer count_in;
	wire count_out;
	//wire [31:0] count_in_wire;
	reg r, g;
	wire r_task, g_task;		

	always @(posedge clk, negedge reset)
		if (!reset) 
			counter = 0;
		else
			if (!button)
				if (25 == count_in)
					case (counter)
						0: counter <= 1;
						1: counter <= 0;
						//2: counter <= 3;
						//3: counter <= 0;
						default: counter <= 0;
					endcase
			else 
				counter = counter;

	always @(posedge clk)
		if (!reset)
			count_in <= 0;
		else
			case (count_out)
				0: count_in <= 0;
				1: count_in <= count_in + 1;
				default: count_in <= 0;
			endcase

	always @(*)
		if (!reset)
			r = 1;
		else
			case (r_task)
				0: r <= 0;
				1: r <= 1;
				default: r <= 0;
			endcase	

	always @(*)
		if (!reset)
			g = 0;
		else
			case (g_task)
				0: g <= 0;
				1: g <= 1;
				default: g <= 0;
			endcase

	//assign count_in_wire = count_in;

	//assign counter_wire = counter;	
	
rejim rejim_1 (counter, count_in, r, g, red, green, count_out, r_task, g_task);

endmodule
