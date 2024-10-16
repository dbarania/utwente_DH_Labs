module ReadRequets (
	input clk,
	input rdreq,
	input reset,
	output reg read
);

reg flip;

always@(posedge clk) begin 
	if (reset) begin
		if ((flip!=rdreq) & !rdreq) begin
			read <= 1;
			flip<=rdreq;
		end
		else begin
			read <= 0;
			flip<=rdreq;
		end
	end
	else begin
		flip<=0;
	end
end
endmodule