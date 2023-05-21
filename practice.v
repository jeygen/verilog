module m1(
	input wire x;
	output wire y;
);

assign x = y;

endmodule

module m2(
	input wire a;
	output wire b;
);

assign a = b;

endmodule

m1 mym1(.x(y);

$display( //output of mym1)


