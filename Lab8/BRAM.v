module BRAM (
	input clk,
	input [3:0] data,
	input rdreq,
	input wrreq,
	input reset,
	output data_ready,
	output [3:0]  q,
	output [6:0] HEX0,
   output [6:0] HEX1,
   output [6:0] HEX2

);

wire read;
wire write;

wire [8:0]  Bin;
reg [3:0] Bin_0;
reg [3:0] Bin_1;
reg [3:0] Bin_2;

// WriteRequets Write_flipflop(.clk(clk), .wrreq(wrreq), .write(write), .reset(reset));
// ReadRequets Read_flipflop(.clk(clk), .rdreq(rdreq), .read(read), .reset(reset));
// FIFO_block FIFO(.clock(clk), .data(data), .rdreq(read), .wrreq(write), .q(q), .usedw(Bin));

always@(posedge clk) begin 
	Bin_0<=Bin%10;
	Bin_1<=(Bin/10)%10;
	Bin_2<=Bin/100;

end

Bin2Seg Seg_0(.Bin(Bin_0), .seg(HEX0));
Bin2Seg Seg_1(.Bin(Bin_1), .seg(HEX1));
Bin2Seg Seg_2(.Bin(Bin_2), .seg(HEX2));

assign data_ready = (|Bin && ~&Bin);
endmodule 

