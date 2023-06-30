// Detect Pattern of serial bits

// Bitwise Majority Function: Write a Verilog module that takes in three bits as inputs 
// and outputs a bit that represents the majority function (i.e., the output bit is 1 if 
// at least two of the input bits are 1; otherwise, the output bit is 0)

// Serial to Parallel Converter: Implement a Verilog module that converts a serial bitstream
// into a parallel one. The module should take a clock, a reset, and a serial input bitstream 
// as inputs and provide a multi-bit parallel output. Assume the width of the parallel output
// to be parameterizable

// Edge Detector: Design a Verilog module that takes a clock and a single bit input, and 
// generates a single cycle pulse whenever the input changes from 0 to 1 (a rising edge)
// use clk

// Frequency Divider: Write a Verilog module that divides the input frequency by a given 
// factor. The module should take a clock (of frequency f) and a reset signal as inputs, 
// and generate an output clock signal with frequency f/N, where N is the divisor specified.

// code a mux
// code a PC
// code an ALU
// code RAM
// code shift reg
// code priority mux




module pattern_detector(
    input wire clk,
    input wire reset,
    input wire serial_data,
    output reg pattern_detected
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
            pattern_detected <= 1'b0;
        end else begin
            shift_reg <= {shift_reg[2:0], serial_data};
            if (shift_reg == 4'b1101) begin
                pattern_detected <= 1'b1;
            end else begin
                pattern_detected <= 1'b0;
            end
        end
    end
endmodule

module tb_pattern_detector();
    reg clk;
    reg reset;
    reg serial_data;
    wire pattern_detected;

    // Instantiate the DUT
	// .portname_from_instant_module(tb_signal_name)
    pattern_detector u1(.clk(clk), .reset(reset), .serial_data(serial_data), .pattern_detected(pattern_detected));

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        serial_data = 0;
        #10 reset = 0;  // De-assert reset after a short delay

        // Apply a pattern
        #20 serial_data = 1;  // 1---
        #20 serial_data = 1;  // 11--
        #20 serial_data = 0;  // 110-
        #20 serial_data = 1;  // 1101 --> pattern detected!

        // Apply some more patterns
        #20 serial_data = 0;  
        #20 serial_data = 1;
        #20 serial_data = 0;
        #20 serial_data = 0;
        #20 serial_data = 1;
        #20 serial_data = 1;  // 1101 --> pattern detected again!
    end

    // Clock generator
    always #10 clk = ~clk;

    // Monitor
    always @(posedge clk) begin
        if (pattern_detected)
            $display("Pattern detected at time %t", $time);
    end
endmodule

// Majority function module
module majority (
    input wire a, b, c,  // Three input bits
    output wire majority // Output bit representing majority function
);
    assign majority = ((a & b) | (a & c) | (b & c));
endmodule

// Testbench for the majority function module
module tb_majority();
    reg a, b, c;
    wire maj;

    majority U1 (.a(a), .b(b), .c(c), .majority(maj));

    initial begin
        // Test all combinations of inputs
        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;
        $finish;
    end

    initial begin
        $monitor("At time %t, a = %b, b = %b, c = %b, Majority = %b", $time, a, b, c, maj);
    end
endmodule

// Serial to Parallel converter module
module serial_to_parallel (
    input wire clk, reset, serial_in,  // Clock, reset, and serial input bit
    output reg [3:0] parallel_out      // 4-bit parallel output
);
    always @(posedge clk or posedge reset) begin
        if (reset) parallel_out <= 4'b0000;
        else parallel_out <= {parallel_out[2:0], serial_in};
    end
endmodule

// Testbench for the Serial to Parallel converter module
module tb_serial_to_parallel();
    reg clk, reset, serial_in;
    wire [3:0] parallel_out;

    // Instantiate the module
    serial_to_parallel U1 (.clk(clk), .reset(reset), .serial_in(serial_in), .parallel_out(parallel_out));

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; serial_in = 0; #10;
        reset = 0; // Start the operation
        // Send serial data
        #10; serial_in = 1;
        #10; serial_in = 0;
        #10; serial_in = 1;
        #10; serial_in = 1;
        #50; $finish;
    end

    initial begin
        $monitor("At time %t, Serial_in = %b, Parallel_out = %b", $time, serial_in, parallel_out);
    end
endmodule

// Edge detector module
module edge_detector (
    input wire clk, reset, in,  // Clock, reset, and input signal
    output reg pulse            // Output pulse );
    reg in_d;  // Delayed version of 'in', tracks prev cycle val of in


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            in_d <= 0;
            pulse <= 0;
        end else begin
			// in_d holds prev val to compare to, AND operator to ensure they
			// are opposites 
            pulse <= in & ~in_d;
            in_d <= in;
        end
    end
endmodule

// Testbench for the Edge detector module
module tb_edge_detector();
    reg clk, reset, in;
    wire pulse;

    // Instantiate the module
    edge_detector U1 (.clk(clk), .reset(reset), .in(in), .pulse(pulse));

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; in = 0; #10;
        reset = 0; // Start the operation
        #10; in = 1;
        #20; in = 0;
        #10; in = 1;
        #20; in = 0;
        #50; $finish;
    end

    initial begin
        $monitor("At time %t, In = %b, Pulse = %b", $time, in, pulse);
    end
endmodule

// Frequency divider module
module frequency_divider (
    input wire clk, reset,  // Clock and reset
    output reg clk_out      // Output clock
);
    reg [2:0] count;  // 3-bit counter

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 3'b000;  // Initialize counter
            clk_out <= 0;  // Initialize output clock
        end
        else if (count == 3'b100) begin
            count <= 3'b000;  // Reset counter
            clk_out <= ~clk_out;  // Toggle output clock
        end
        else
            count <= count + 1;  // Increment counter
    end
endmodule

// Testbench for the Frequency divider module
module tb_frequency_divider();
    reg clk, reset;
    wire clk_out;

    // Instantiate the module
    frequency_divider U1 (.clk(clk), .reset(reset), .clk_out(clk_out));

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; #10;
        reset = 0;  // Start the operation
        #100; $finish;  // Run for a certain amount of time
    end

    initial begin
        $monitor("At time %t, Clk = %b, Clk_out = %b", $time, clk, clk_out);
    end
endmodule

