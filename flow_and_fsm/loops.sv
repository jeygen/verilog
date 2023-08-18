/*
forever loops 
commonly used to create clock signal in testbenches
Also intial blocks are used more commonly in testbenches as often just want it to run once
# is a time unit delay operator, default is 1ns i think
can set with directives
use $finish system call to end forever loop

inital begin
  clk = 1'b0;
  forever begin
     #500 clk = ~clk;
  end
end   
*/

// for loops
  // fill-in later


// gen var loops
  // gen vars are synthesiazable, create multiple instances, modules, assigns, etc
  // gets unrolled BEFORE simulation
  // use when instantiating multiple hw objects
  // use normal for time-simulation operations

  generate
      for (genvar i = 0; i < 4; i = i + 1) begin: gen_block
          // Code to be replicated. For example, instances of a module.
      end
  endgenerate

  // another example, gen 4 2to1 mux
  module mux(input [3:0] a, b, output y);
    generate
      genvar i;
      for (i=0; i<4; i=i+1) begin: gen_loop
        assign y[i] = (sel) ? a[i] : b[i];
      end
    endgenerate
  endmodule


