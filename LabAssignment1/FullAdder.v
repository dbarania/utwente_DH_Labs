module FullAdder(
	input [7:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1
);

    Adder adder(
        .A(SW[7:4]),      // Top 4 bits (A)
        .B(SW[3:0]),      // Bottom 4 bits (B)
        .S0(HEX0),        // Ones place output to HEX0
        .S1(HEX1)         // Tens place output to HEX1
    );

endmodule