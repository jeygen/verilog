// back ticks are for macros and system tasks

`define WIDTH 8
`display("Hello, world!");  // Display a message during simulation
`time;  // Get the current simulation time

&(1011) is a reduction operator, it results in 1 bit answer = 1 & 0 & 1 & 1 = 0
|, ^, ~ also are reduction operators

Checks if if macro defined use it
`ifdef
`endif

Checkis if not defined then define and use
`ifndef
`endif
