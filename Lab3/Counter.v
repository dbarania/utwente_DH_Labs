module Counter(
    input clk,
    input reset,
    output [9:0] LEDR,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3
);

    reg [15:0] main_counter; // 16-bit counter
    wire slow_clk;           // Slow clock signal
    
    // Instantiate the clock divider
    SlowerClock clock_divider(.clk(clk), .reset(reset), .slow_clk(slow_clk));
    
    // Always block for the main counter
    always @(posedge slow_clk or posedge reset) begin
        if (reset) begin
            main_counter <= 16'b0; // Reset counter to 0 when reset is high
        end else begin
            main_counter <= main_counter + 1; // Increment counter
        end
    end
    
    // Assign counter value to LEDs
    assign LEDR = main_counter[9:0]; // Show lower 10 bits of the counter on LEDs

    // Instantiate the binary to 7-segment decoders
    BinTo7Seg seg0(.binary(main_counter[3:0]), .seg(HEX0));   // LSN
    BinTo7Seg seg1(.binary(main_counter[7:4]), .seg(HEX1));   // 2nd nibble
    BinTo7Seg seg2(.binary(main_counter[11:8]), .seg(HEX2));  // 3rd nibble
    BinTo7Seg seg3(.binary(main_counter[15:12]), .seg(HEX3)); // MSN

endmodule
