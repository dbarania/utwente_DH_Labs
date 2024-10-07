module BinTo7Seg(
    input [3:0] binary,
    output reg [6:0] seg // Make seg a reg to use in always block
);

    always @(*) begin
        case (binary)
            4'b0000: seg = ~7'b0111111; // 0
            4'b0001: seg = ~7'b0000110; // 1
            4'b0010: seg = ~7'b1011011; // 2
            4'b0011: seg = ~7'b1001111; // 3
            4'b0100: seg = ~7'b1100110; // 4
            4'b0101: seg = ~7'b1101101; // 5
            4'b0110: seg = ~7'b1111101; // 6
            4'b0111: seg = ~7'b0000111; // 7
            4'b1000: seg = ~7'b1111111; // 8
            4'b1001: seg = ~7'b1101111; // 9
            4'b1010: seg = ~7'b1110111; // A
            4'b1011: seg = ~7'b1111111; // B
            4'b1100: seg = ~7'b0111001; // C
            4'b1101: seg = ~7'b0111111; // D
            4'b1110: seg = ~7'b1111001; // E
            4'b1111: seg = ~7'b1110001; // F
            default: seg = ~7'b0000000; // Off
        endcase
		  
    end

endmodule
