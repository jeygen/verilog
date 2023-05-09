/*
Blocking assignment: =
	instant
	outside or inside block for reg type
	occurs as it appears
	comb log as only depends on inputs
Non-Blocking: <=
	after current time step 
	inside always block
	for clocks and stuff
	seq log as depends on state and inputs
Continuous Assignment: assign x = y 
	for direct input to output
	for wire type

Reg
	holds value
Wire
	does not hold value, ie continuous

*/

module assignment_example (
  input wire in1,
  input wire in2,
  output reg out1,
  output wire out2
);

  reg reg1;  // a register variable
  wire wire1;  // a wire variable

  always @(*) begin
    // Non-blocking assignment to reg1
    reg1 <= in1;
    
    // Blocking assignment to out1
    out1 = in2;
  end

  // Continuous assignment to wire1
  assign wire1 = in1 & in2;
  
  // Continuous assignment to out2
  assign out2 = wire1;

endmodule

