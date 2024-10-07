module ALU(
	input signed [2:0] A,
	input signed [2:0] B,
	input [2:0] opcode,
	output [2:0] result,
	output overflow
);


	assign result = 	(opcode == 3'b000) ? (A & B) :
							(opcode == 3'b001) ? (A | B) :
							(opcode == 3'b010) ? (A ^ B) :
							(opcode == 3'b011) ? (~A) :
							(opcode == 3'b100) ? (A > B):
							(opcode == 3'b101) ? (A + B):
							(opcode == 3'b110) ? (A * B):
							(opcode == 3'b111) ? (~A + 1):
							3'b000;

	assign overflow = (opcode == 3'b101) ? (~A[2] & ~B[2] & result[2]) | (A[2] & B[2] & ~result[2]):
							(opcode == 3'b110) ? (A * B > 3'sb011 || A * B < 3'sb100):
							1'b0;

endmodule
