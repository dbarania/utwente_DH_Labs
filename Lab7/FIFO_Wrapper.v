module FIFO_Wrapper(
    input [3:0] SW,
    input [3:0] KEY,
    input CLOCK_50,
    output [9:0] LEDR,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2
);

    wire [8:0] el_counter;

    FIFO fifo(
        .data_in(SW),
        .write_req(KEY[0]),
        .read_req(KEY[1]),
        .clk(CLOCK_50),
        .reset(KEY[3]),
        .data_out(LEDR[3:0]),
        .data_ready(LEDR[9]),
        .element_counter(el_counter)
    );

    BinTo7Seg S0(
        .binary(el_counter[3:0]),
        .seg(HEX0)
    );
    BinTo7Seg S1(
        .binary(el_counter[7:4]),
        .seg(HEX1)
    );
    BinTo7Seg S2(
        .binary(el_counter[8:7]),
        .seg(HEX2)
    );
endmodule