
module Ram	(input			clk, WE,
		 input		[31:0]	addr,
		 input		[31:0]	i_data,
		 output		[31:0]	o_data);

		 reg [31:0]	mem	[0:31];

	always @(posedge clk)
		if (WE)
			mem [addr] <= i_data;

	assign o_data = mem [addr];

endmodule
