module RAM(
	input wire [3:0] data_in,
	input wire [2:0] address,
	input wire [0:0] write_enable,
	input wire [0:0] reset,
	input wire clk,
	output reg [3:0] data_out
);

	reg [3:0] memory [7:0];
	
	always @ (posedge clk) begin
		if(!reset) begin
			memory[address] <= 4'b0000;
		end
		
		else if(!write_enable) begin
			memory[address] <= data_in;
		end
		
		else begin
			data_out <= memory[address];
		end
	end
	
endmodule
	