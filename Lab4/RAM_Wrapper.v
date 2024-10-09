module RAM_Wrapper(
	input [9:0] SW,
	input [3:0] KEY,
	input CLOCK_50,
	output [3:0] LEDR
);

	RAM ram(.data_in(SW[9:6]),
			  .address(SW[2:0]), 
			  .write_enable(KEY[0]), 
			  .reset(KEY[3]), 
			  .clk(CLOCK_50), 
			  .data_out(LEDR));

endmodule