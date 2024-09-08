// half_adder_tb.v
module half_adder_tb;

    // Inputs to the half adder
    reg a;
    reg b;

    // Outputs from the half adder
    wire sum;
    wire carry;

    // Instantiate the half adder
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Test procedure
    initial begin
        // Monitor the signals
        $monitor("a = %b, b = %b, sum = %b, carry = %b", a, b, sum, carry);

        // Apply test cases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // End the simulation
        $finish;
    end

    // for waves 
initial begin
    $dumpfile("half_adder_wave.vcd");  // Specify the VCD file
    $dumpvars(0, half_adder_tb);       // Dump all variables for this module
end

endmodule

