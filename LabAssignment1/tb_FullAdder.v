module tb_FullAdder;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [6:0] S0;  // Ones place 7-segment display output
    wire [6:0] S1;  // Tens place 7-segment display output

    // Instantiate the FullAdder module
    FullAdder uut (
        .A(A),
        .B(B),
        .S0(S0),
        .S1(S1)
    );

    // Task to display the values of S0 and S1 for easier interpretation
    task display_segments;
        input [6:0] S0, S1;
        begin
            $display("A = %d, B = %d -> S0 (Ones) = %h, S1 (Tens) = %h", A, B, S0, S1);
        end
    endtask

    initial begin
        // Test Case 1: A = 4, B = 3 (sum = 7)
        A = 4'd4; B = 4'd3;
        #10;
        display_segments(S0, S1);

        // Test Case 2: A = 9, B = 5 (sum = 14)
        A = 4'd9; B = 4'd5;
        #10;
        display_segments(S0, S1);

        // Test Case 3: A = 7, B = 8 (sum = 15)
        A = 4'd7; B = 4'd8;
        #10;
        display_segments(S0, S1);

        // Test Case 4: A = 6, B = 6 (sum = 12)
        A = 4'd6; B = 4'd6;
        #10;
        display_segments(S0, S1);

        // Test Case 5: A = 15, B = 15 (sum = 30)
        A = 4'd15; B = 4'd15;
        #10;
        display_segments(S0, S1);

        // End simulation
        $stop;
    end
endmodule
