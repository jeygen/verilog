module Testbench;
  
  initial begin
    $display("Starting simulation at time %0t", $time);
    
    // Read command-line arguments using $$test$plusargs
    if ($test$plusargs("verbose")) begin
      $display("Verbose mode enabled");
    end
    
    // if $$ than checking for specific existence of arg
    // Read command-line arguments with value using $$value$plusargs
    if ($value$plusargs("iterations=%d", iterations)) begin
      $display("Number of iterations: %d", iterations);
    end
    
    // Generate random numbers using $random
    integer random_value = $random;
    $display("Random value: %d", random_value);
    
    // Display a message using $display
    $display("Simulation in progress...");
    
    // Pause simulation using $stop
    $stop;
    
    // Simulation resumes here after $stop
    
    // Finish simulation using $finish
    $finish;
    
    // Simulation continues here after $finish
  end
  
endmodule
