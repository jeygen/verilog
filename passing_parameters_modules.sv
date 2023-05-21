/*
module funct #(parameter n=8) (input clk, input [n-1:0] in, input rst, output [n-1:0] out);

A_module # (.A_PARAMETER (a_constant_value),.ANOTHER_PARAMETER (7)) an_instance_name (.a_port (a_wire),.another_port (another_wire_or_constant))

if you pass less args than there are then will use default
