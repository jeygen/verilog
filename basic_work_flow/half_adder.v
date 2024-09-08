// half_adder.v
module half_adder (
    input wire a,    // First input
    input wire b,    // Second input
    output wire sum, // Sum output
    output wire carry // Carry output
);

    // Logic for sum and carry
    assign sum = a ^ b;   // Sum is XOR of a and b
    assign carry = a & b; // Carry is AND of a and b

endmodule

