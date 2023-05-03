module example_module(
  input clk,                  // Input port for clock signal
  input rst,                  // Input port for reset signal
  input [7:0] data_in,        // Input port for data (8 bits wide)
  output [7:0] data_out       // Output port for data (8 bits wide)
);

  reg [7:0] reg_data;         // Define a register called "reg_data" that is 8 bits wide

  always @(posedge clk or posedge rst) begin  // Execute the block of code on the rising edge of "clk" or "rst"
    if (rst) begin                            // If the "rst" signal is high (i.e., asserted)
      reg_data <= 8'h00;                      // Set the value of "reg_data" to 0, 8 bit(') constant of 00 as no 0x
    end else begin                            // Otherwise (i.e., if "rst" is low)
      reg_data <= data_in;                    // Set the value of "reg_data" to the value of "data_in"
    end
  end

  // assign is for input and output equalities 
  assign data_out = reg_data;  // Assign the value of "reg_data" to "data_out"

endmodule
