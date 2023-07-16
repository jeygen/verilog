/*
two types of asserts: immediate and concurrent

concurrent use "assert property"
if condition is true nothing happens
  'disable iff' allows conditional skipping of assert property
*/

// concurrent assert
module top;
    reg clk;
    reg rst_n;
    reg [7:0] data;

    // Clock generator
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Reset and data generator
    initial begin
        rst_n = 0;
        #15 rst_n = 1;
        #10;
        data = 8'hA5;
        #20;
        data = 8'hFF;
        #20;
        $finish;
    end

    // An assertion for error management
    // This assertion checks that when reset is asserted, data should be 0.
    // If not, print an error message.
    always @(posedge clk) begin
        assert (rst_n || (data == 0))
            else $error("Data is not zero when reset is asserted");
    end
endmodule

// immediate assert
module top;
    reg [7:0] data;
    reg       valid;
    
    initial begin
        valid = 0;
        data = 8'h00;
        #10;
        
        valid = 1;
        data = 8'hA5;
        assert (valid && (data == 8'hA5)) else $error("Data mismatch when valid is asserted");
        
        #20;
        
        valid = 0;
        data = 8'hFF;
        assert (!valid) else $error("Valid is not deasserted");
        
        #10;
        $finish;
    end
endmodule

