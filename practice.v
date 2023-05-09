module(
	input wire a
	input wire b
	input wire sel
	output reg z
);

	always_comb begin
		if (sel == 1b'0) begin
			z = a;
		end;
		else begin
			z = b;
		end
	end

endmodule;
	 
