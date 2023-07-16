// lets go

module edge_det (
  wire input in,
  wire input clk,
  wire output out
);

reg past_in;

always @(posedge clk) begin
  out <= in & ~past_in;
  past_in <= in;
end


	

