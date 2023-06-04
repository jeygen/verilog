// And gate that we will test

module and_gate (
    input wire A, // Input A
    input wire B, // Input B
    output wire Y // Output Y
);

    assign Y = A & B; // AND operation

endmodule

// implement test bench

module test_and_gate;

    // Declare wires for inputs and output
    wire Y;
    reg A, B;

    // Instantiate the and_gate module
    and_gate u1 (
        .A(A), 
        .B(B), 
        .Y(Y)
    );

    // Stimulus process
  
    initial begin
        // Apply different combinations of inputs
        A = 0; B = 0; #10; // expect Y = 0 // #10 is time delay between statements
        A = 0; B = 1; #10; // expect Y = 0
        A = 1; B = 0; #10; // expect Y = 0
        A = 1; B = 1; #10; // expect Y = 1

        // Finish the simulation
        $finish;
    end

    // Monitor process
    initial begin
        $monitor("At time %0dns, Inputs : A = %b, B = %b, Output : Y = %b",
                 $time, A, B, Y);
    end

endmodule
