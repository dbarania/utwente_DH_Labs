module BcdDecoder(
	input [7:0] value,
	output reg[6:0] seg0,
	output reg[6:0] seg1
);
	
	    reg [3:0] ones;
    reg [3:0] tens;

    always @(*) begin
        // Split sum into ones and tens digits
        ones = value % 10;
        tens = value / 10;

        // Decode ones digit
        case (ones)
            4'b0000: seg0 = 7'b1000000;
            4'b0001: seg0 = 7'b1111001;
            4'b0010: seg0 = 7'b0100100;
            4'b0011: seg0 = 7'b0110000;
            4'b0100: seg0 = 7'b0011001;
            4'b0101: seg0 = 7'b0010010;
            4'b0110: seg0 = 7'b0000010;
            4'b0111: seg0 = 7'b1111000;
            4'b1000: seg0 = 7'b0000000;
            4'b1001: seg0 = 7'b0010000;
            default: seg0 = 7'b1111111;
        endcase

        // Decode tens digit
        case (tens)
            4'b0000: seg1 = 7'b1000000;
            4'b0001: seg1 = 7'b1111001;
            4'b0010: seg1 = 7'b0100100;
            4'b0011: seg1 = 7'b0110000;
            4'b0100: seg1 = 7'b0011001;
            4'b0101: seg1 = 7'b0010010;
            4'b0110: seg1 = 7'b0000010;
            4'b0111: seg1 = 7'b1111000;
            4'b1000: seg1 = 7'b0000000;
            4'b1001: seg1 = 7'b0010000;
            default: seg1 = 7'b1111111;
        endcase
    end
endmodule