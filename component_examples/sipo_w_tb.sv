// Code a SIPO shift register, choose left, right or bi
    // set-up a tb for it

    // Code a SIPO shift register, choose left, right or bi
// set-up a tb for it

// Code a SIPO shift register, choose left, right or bi
// set-up a tb for it

// Code a SIPO shift register, choose left, right or bi
// set-up a tb for it

module sipo_shift (
  input wire en,
  input wire clk,
  input wire sipo_in,
  output wire [8-1:0] sipo_out
);

  reg [8-1:0] buffer;

  always @(posedge clk) begin
    if (en) begin
      buffer <= {sipo_in, buffer[8-1:1]};
    end
  end

  assign sipo_out = buffer;

endmodule

module sipo_shift_tb;

  // Inputs
  reg en;
  reg clk;
  reg sipo_in;

  // Outputs
  wire [8-1:0] sipo_out;

  // Instantiate the DUT
  sipo_shift dut (
    .en(en),
    .clk(clk),
    .sipo_in(sipo_in),
    .sipo_out(sipo_out)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;  // Half period delay
    clk = 1;
    #5;  // Half period delay
  end

  initial begin
    // Initialize inputs
    en = 1;
    sipo_in = 0;

    // Stimulus
    #10; // Wait for initial values to settle
    sipo_in = 1; // Input value = 1
    #10;
    sipo_in = 0; // Input value = 0
    #10;
    sipo_in = 1; // Input value = 1
    #10;

    // Output monitoring
    $display("sipo_out in hex = %h, in bin = %b", sipo_out, sipo_out);

    // End simulation
    $finish;
  end

endmodule

