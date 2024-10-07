module Adder(
	input signed [3:0] A,
	input signed [3:0] B,
	output [6:0] S0,
	output [6:0] S1,
	output overflow);
	
	wire signed [4:0] full_sum;
	assign full_sum = A + B;
	
	assign sum = full_sum[3:0];
   assign overflow = (a[3] == b[3]) && (sum[3] != a[3]);
	 
	assign S0 = (sum %10 == 4'd0) ? 8'hc0:
				(sum % 10 == 4'd1) ? 8'hf9:
				(sum % 10 == 4'd2) ? 8'ha4:
				(sum % 10 == 4'd3) ? 8'hb0:
				(sum % 10 == 4'd4) ? 8'h99:
				(sum % 10 == 4'd5) ? 8'h92:
				(sum % 10 == 4'd6) ? 8'h82:
				(sum % 10 == 4'd7) ? 8'hf8:
				(sum % 10 == 4'd8) ? 8'h80:
				(sum % 10 == 4'd9) ? 8'h90: 8'h00;
				
	assign S1 = (sum /10 == 4'd0) ? 8'hc0:
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
	