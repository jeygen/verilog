/*
It's important to note that the force statement has a local effect and only affects the simulation behavior. 
It does not modify the actual hardware behavior in a synthesis process.
Therefore, it should be used with caution and primarily in testbenches or simulation environments.
*/

module Testbench;
  reg data;

  initial begin
    // Apply a forced value to 'data' for testing purposes
    // 'data' will be temporarily set to 1'b1 (logic 1)
    force data = 1'b1;

    // Perform test-related operations using the forced value of 'data'
    // ...

    // Remove the forced value from 'data' and restore its normal behavior
    // 'data' will now be driven by other design logic or assignments
    release data;

    // Continue simulation and observe normal behavior of 'data'
    // ...
  end
endmodule
