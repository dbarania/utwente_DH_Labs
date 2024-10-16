module FIFO_tb;

    // Testbench Signals
    reg [3:0] data_in;
    reg write_req;
    reg read_req;
    reg clk;
    reg reset;
    wire [3:0] data_out;
    wire data_ready;
    wire [8:0] element_counter;

    // Instantiate the FIFO module
    FIFO uut (
        .data_in(data_in),
        .write_req(write_req),
        .read_req(read_req),
        .clk(clk),
        .reset(reset),
        .data_out(data_out),
        .data_ready(data_ready),
        .element_counter(element_counter)
    );

    // Generate Clock Signal
    always begin
        clk = 1'b0;
        #5;          // 5 time units low
        clk = 1'b1;
        #5;          // 5 time units high (10 time unit period)
    end

    // Test Sequence
    initial begin
        // Initialize Signals
        data_in = 4'b0000;
        write_req = 1'b1;  // Active low, so high means no write
        read_req = 1'b1;   // Active low, so high means no read
        reset = 1'b1;      // Active low reset

        // Apply Reset
        #10 reset = 1'b0;  // Activate reset (low)
        #10 reset = 1'b1;  // Deactivate reset (high)

        // Start Write Operations
        #10 write_req = 1'b0;  // Request write
        data_in = 4'b0001;     // Input data = 1
        #10 write_req = 1'b1;  // End write

        #10 write_req = 1'b0;  // Request write
        data_in = 4'b0010;     // Input data = 2
        #10 write_req = 1'b1;  // End write

        #10 write_req = 1'b0;  // Request write
        data_in = 4'b0011;     // Input data = 3
        #10 write_req = 1'b1;  // End write

        // Start Read Operations
        #20 read_req = 1'b0;   // Request read
        #10 read_req = 1'b1;   // End read

        #10 read_req = 1'b0;   // Request read
        #10 read_req = 1'b1;   // End read

        #10 read_req = 1'b0;   // Request read
        #10 read_req = 1'b1;   // End read

        // Observe the outputs
        #20 $finish;
    end

    // Monitor Signals (Optional)
    initial begin
        $monitor("Time=%0t | data_in=%b | write_req=%b | read_req=%b | reset=%b | data_out=%b | element_counter=%d | data_ready=%b",
                 $time, data_in, write_req, read_req, reset, data_out, element_counter, data_ready);
    end

endmodule
