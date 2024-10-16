module BRAM_FIFO_Wrapper(
	input [3:0] SW,
	input [3:0] KEY,
	input CLOCK_50,
	output [9:0] LEDR,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2
);

	 wire [8:0]  Bin;
	 assign write_req = KEY[0];
	 assign read_req = KEY[1];
	 assign reset = KEY[3];
	 reg prev_write_req;
    reg prev_read_req;
    reg prev_reset;
	 wire [3:0] data_out;
	 wire empty;

    wire write_req_edge = ~prev_write_req && write_req;
    wire read_req_edge = ~prev_read_req && read_req;
    wire reset_edge = ~prev_reset && reset;

	always @(posedge CLOCK_50) begin
        prev_write_req <= write_req;
        prev_read_req <= read_req;
        prev_reset <= reset;
	end


	BRAM_FIFO fifo(
		.clock(CLOCK_50),
		.data(SW),
		.rdreq(read_req_edge),
		.wrreq(write_req_edge),
		.aclr(reset_edge),
		.q(data_out),
		.usedw(Bin),
		.empty(empty)
	);
	
	    BinTo7Seg S0(
        .binary(Bin[3:0]),
        .seg(HEX0)
    );
    BinTo7Seg S1(
        .binary(Bin[7:4]),
        .seg(HEX1)
    );
    BinTo7Seg S2(
        .binary(Bin[8:7]),
        .seg(HEX2)
    );
	assign LEDR[3:0] = (!empty) ? data_out: 4'b0000;
	assign LEDR[9] = (|Bin && ~&Bin);

	
endmodule