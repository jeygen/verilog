module mux4to1_priority(input [3:0] a, input [1:0] sel, output reg y);
    // input [3:0] a is an array of four inputs to the multiplexer
    // input [1:0] sel is a two-bit select signal that chooses which input to pass through to the output
    // output reg y is the output of the multiplexer
    
    always @(*) begin
        // The always block contains a combinational logic block that is sensitive to any changes in the inputs
        // It selects the appropriate input based on the value of sel and assigns it to the output y
        case(sel)
            2'b00: y = a[0]; // If sel is 2'b00, connect output y to input a[0] (highest priority)
            2'b01: y = a[1]; // If sel is 2'b01, connect output y to input a[1] (second highest priority)
            2'b10: y = a[2]; // If sel is 2'b10, connect output y to input a[2] (third highest priority)
            2'b11: y = a[3]; // If sel is 2'b11, connect output y to input a[3] (lowest priority)
        endcase
    end

endmodule

/*
always @(*) begin is a Verilog code construct that defines a combinational logic block, which is a block of logic that computes an output based solely on the inputs.

The @(*) syntax is used to define sensitivity to changes in any of the input signals. This means that whenever any of the input signals change, the block will be re-evaluated to compute the new output.
*/

