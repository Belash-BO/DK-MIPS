
module Rom	(input		[31:0]	address,
		 output		[31:0]	data);

		 reg [31:0]	mem	[0:255];

	initial $readmemb ("rom_init.dat", mem);
	
	assign	data = mem [address];

endmodule
