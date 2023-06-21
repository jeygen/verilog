// `timescale time_unit/time_precision
// default is 1ns/1ns
// could be:
`timescale 1ns/1ps


module tb;
    reg clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Creates a clock with period of 10 time units
    end
endmodule

module tb2;
    reg clk;

    initial begin
        clk = 0;
        forever begin
            #5;
            clk = 1;
            #5;
            clk = 0;
        end
    end
endmodule
