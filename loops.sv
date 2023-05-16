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
