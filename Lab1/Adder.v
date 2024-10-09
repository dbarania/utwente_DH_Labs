module Adder(
	input signed [3:0] A,
	input signed [3:0] B,
	output [6:0] S1,
	output [6:0] S10,
	output [6:0] SSign,
	output overflow
);

	wire signed [4:0] fullSum;
	wire signed [3:0] sum;
	assign fullSum = A + B;
	
	assign sum = fullSum[3:0];
	

	assign overflow =  (~A[3] & ~B[3] & sum[3]) | (A[3] & B[3] & ~sum[3]);

	assign SSign = (sum[3] == 1'b1) ? 7'b0111111 : 7'b10000000;

	wire [3:0] magnitude;
	assign magnitude = (sum[3] == 1'b0) ? sum : (~sum) + 1;
	assign S1 = (sum %10 == 4'd0) ? 7'b1000000:
				(sum % 10 == 4'd1) ? 7'b1111001:
				(sum % 10 == 4'd2) ? 7'b0100100:
				(sum % 10 == 4'd3) ? 7'b0110000:
				(sum % 10 == 4'd4) ? 7'b0011001:
				(sum % 10 == 4'd5) ? 7'b0010010:
				(sum % 10 == 4'd6) ? 7'b0000010:
				(sum % 10 == 4'd7) ? 7'b1111000:
				(sum % 10 == 4'd8) ? 7'b0000000:
				(sum % 10 == 4'd9) ? 7'b0010000: 
				7'b1111111;
				
	assign S10 = (sum / 10 == 4'd0) ? 7'b1000000:
				(sum / 10 == 4'd1) ? 7'b1111001:
				(sum / 10 == 4'd2) ? 7'b0100100:
				(sum / 10 == 4'd3) ? 7'b0110000:
				(sum / 10 == 4'd4) ? 7'b0011001:
				(sum / 10 == 4'd5) ? 7'b0010010:
				(sum / 10 == 4'd6) ? 7'b0000010:
				(sum / 10 == 4'd7) ? 7'b1111000:
				(sum / 10 == 4'd8) ? 7'b0000000:
				(sum / 10 == 4'd9) ? 7'b0010000: 
				7'b1111111;


endmodule



