module FIFO(
    input wire [3:0] data_in,
    input wire write_req,
    input wire read_req,
    input wire clk,
    input wire reset,
    output reg [3:0] data_out,
    output wire data_ready,
    output wire [8:0] element_counter
);

    reg [3:0] memory [511:0];
    reg [8:0] read_address;
    reg [8:0] write_address;
    reg [8:0] el_counter;
    
    reg prev_write_req;
    reg prev_read_req;
    reg prev_reset;

    // Edge detection logic
    wire write_req_edge = ~prev_write_req && write_req;
    wire read_req_edge = ~prev_read_req && read_req;
    wire reset_edge = ~prev_reset && reset;

    always @(posedge clk) begin
        // Store the previous state of buttons
        prev_write_req <= write_req;
        prev_read_req <= read_req;
        prev_reset <= reset;

        if (reset_edge) begin
            read_address <= 9'b0;
            write_address <= 9'b0;
            el_counter <= 9'b0;
            data_out <= 4'b0;
        end
        else if (write_req_edge && ~&element_counter) begin
            memory[write_address] <= data_in;
            write_address <= write_address + 9'b1;
            el_counter <= element_counter + 9'b1;
        end
        else if (read_req_edge && element_counter) begin
            data_out <= memory[read_address];
            read_address <= read_address + 9'b1;
            el_counter <= element_counter - 9'b1;
        end
    end

    assign element_counter = el_counter;
    assign data_ready = (|element_counter && ~&element_counter);
    
endmodule
