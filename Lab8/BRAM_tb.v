`timescale 1ns/1ps

module BRAM_tb;

    // Inputs
    reg clk;
    reg [3:0] data;
    reg rdreq;
    reg wrreq;
    reg reset;

    // Outputs
    wire data_ready;
    wire [3:0] q;
    wire [6:0] HEX0;
    wire [6:0] HEX1;
    wire [6:0] HEX2;

    // Instantiate the Unit Under Test (UUT)
    BRAM uut (
        .clk(clk),
        .data(data),
        .rdreq(rdreq),
        .wrreq(wrreq),
        .reset(reset),
        .data_ready(data_ready),
        .q(q),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2)
    );

    // Clock generation
    always begin
        #10 clk = ~clk;  // 50MHz clock
    end

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        data = 4'b0000;
        rdreq = 1;  // Default to no read (active low)
        wrreq = 1;  // Default to no write (active low)
        reset = 1;

        // Wait for reset to propagate
        #20;
        
        // Apply reset
        reset = 0;
        #20;
        reset = 1;

        // Write sequence
        data = 4'b0011;  // Write 3
        wrreq = 0;
        #20;
        wrreq = 1;

        data = 4'b0101;  // Write 5
        wrreq = 0;
        #20;
        wrreq = 1;

        data = 4'b1010;  // Write 10
        wrreq = 0;
        #20;
        wrreq = 1;

        // Read sequence
        #40;
        rdreq = 0;  // Read 3
        #20;
        rdreq = 1;

        #40;
        rdreq = 0;  // Read 5
        #20;
        rdreq = 1;

        #40;
        rdreq = 0;  // Read 10
        #20;
        rdreq = 1;

        // Wait for some time and finish simulation
        #200;
        $finish;
    end

endmodule
