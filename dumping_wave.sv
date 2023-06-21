module counter (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000; // Reset count to zero
        end
        else if (enable) begin
            count <= count + 1; // Increment count
        end
    end
endmodule

module testbench;
    reg clk = 0;
    reg reset = 1;
    reg enable = 1;
    wire [3:0] count;

    // Instantiate the counter
    counter u1 (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Generate a clock signal
    always #10 clk = ~clk;

    // Drive reset and enable signals
    initial begin
        // Add lines to dump waveforms
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
        
        #15 reset = 0;  // De-assert reset after 15 time units
        #40 enable = 0; // De-assert enable after 40 time units
        #60 $stop;      // Stop the simulation after 60 time units
    end
endmodule

/*
iverilog -o testbench.vvp counter.sv testbench.sv
vvp testbench.vvp
gtkwave testbench.vcd
*/
