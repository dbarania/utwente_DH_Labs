module WriteRequets (
	input clk,
	input wrreq,
	input reset,
	output reg write
);

reg flip;

always@(posedge clk) begin 
	if (reset) begin
		if ((flip!=wrreq) & !wrreq) begin
			write <= 1;
			flip<=wrreq;
		end
		else begin
			write <= 0;
			flip<=wrreq;
		end
	end
	else begin
		flip<=0;
	end
end
endmodule