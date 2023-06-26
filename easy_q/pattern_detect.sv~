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

