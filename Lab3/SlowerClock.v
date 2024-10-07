module SlowerClock(
    input clk,
    input reset,
    output reg slow_clk
);

    reg [25:0] counter; // Counter for generating slow clock
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 26'b0; // Reset counter to 0
            slow_clk <= 1'b0; // Initialize slow_clk to 0
        end else begin
            if (counter == 26'd2500000) begin
                counter <= 26'b0; // Reset counter
                slow_clk <= ~slow_clk; // Toggle slow clock
            end else begin
                counter <= counter + 1; // Increment counter
            end
        end
    end 

endmodule
