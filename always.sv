module example (
  input logic clk,
  input logic enable,
  input logic [7:0] in,
  output logic [7:0] out,
  output logic [7:0] q,
  output logic [7:0] data
);

  // wires are not allowed to be assigned in blocks

  // Combinational always block - for combinational logic, executes immediately
  always_comb begin
    out = in + 1;
  end

  // Positive-edge triggered flip-flop always block - for synchronous logic, triggered by a clock edge
  always_ff @(posedge clk) begin
    q <= in;
  end

  // Latch always block - for asynchronous logic, triggered by an enable signal
  always_latch begin
    if (enable) begin
      data <= in;
    end
  end

  // Sequential always block - for sequential logic without clock, executes whenever any input changes
  always_seq begin
    for (int i = 0; i < 8; i++) begin
      data[i+1] <= data[i];
    end
  end

endmodule

