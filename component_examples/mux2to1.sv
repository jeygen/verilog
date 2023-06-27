// Write like a function kinda with ; tho
module mux2to1 (
  input wire a,
  input wire b,
  input wire sel,
  output reg z
);

  always_comb begin
    if (sel == 1'b0) begin
      z = a;
    end
    else begin
      z = b;
    end
  end

endmodule
