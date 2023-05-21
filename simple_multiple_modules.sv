module m1(
  input wire x,
  output wire y
);

assign y = x;

endmodule

module m2(
  input wire a,
  output wire b
);

assign b = a;

endmodule

module top;
  wire y;
  wire b;

  m1 mym1(.x(y), .y(b));

  initial begin
    $display("Output of mym1: %b", y);
  end

endmodule

