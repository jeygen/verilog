module mux2to1(input a, b, sel, output y);
    // input a, b are the two inputs to the multiplexer
    // sel is the select signal that chooses which input to pass through to the output
    // output y is the output of the multiplexer
    
    // If sel is 0, output y is connected to input a
    // If sel is 1, output y is connected to input b
    assign y = (~sel & a) | (sel & b);
    // The assign statement uses bitwise operators to connect the output to the selected input:
    //   - The ~ operator inverts sel to produce its negated value
    //   - The & operator performs a bitwise AND between the negated sel value and input a, producing a intermediate value
    //   - The & operator performs a bitwise AND between sel and input b, producing another intermediate value
    //   - The | operator performs a bitwise OR between the two intermediate values, producing the final output
endmodule

