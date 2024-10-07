module Adder(
	input [3:0] A,
	input [3:0] B,
	output [6:0] S0,
	output [6:0] S1
);
	wire[4:0] sum;
	assign sum = A + B;
	
assign S0 = (sum % 10 == 4'd0) ? 8'hc0:
				(sum % 10 == 4'd1) ? 8'hf9:
				(sum % 10 == 4'd2) ? 8'ha4:
				(sum % 10 == 4'd3) ? 8'hb0:
				(sum % 10 == 4'd4) ? 8'h99:
				(sum % 10 == 4'd5) ? 8'h92:
				(sum % 10 == 4'd6) ? 8'h82:
				(sum % 10 == 4'd7) ? 8'hf8:
				(sum % 10 == 4'd8) ? 8'h80:
				(sum % 10 == 4'd9) ? 8'h90: 8'h00;
				
assign S1 = (sum / 10 == 4'd0) ? 8'hc0:
				(sum / 10 == 4'd1) ? 8'hf9:
				(sum / 10 == 4'd2) ? 8'ha4:
				(sum / 10 == 4'd3) ? 8'hb0:
				(sum / 10 == 4'd4) ? 8'h99:
				(sum / 10 == 4'd5) ? 8'h92:
				(sum / 10 == 4'd6) ? 8'h82:
				(sum / 10 == 4'd7) ? 8'hf8:
				(sum / 10 == 4'd8) ? 8'h80:
				(sum / 10 == 4'd9) ? 8'h90: 8'h00;

endmodule