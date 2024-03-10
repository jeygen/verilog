`include "uvm_macros.svh" // macros 
import uvm_pkg::*; // factory package w/ env, agent, driver, object classes, etc

module top(); // static component

    our_design dut(); // instance of our design

    initial begin
        // from uvm package, creates test component. naming test "our_test"
        // test comp is dynamic, see test.sv for more
        run_test("our_test");
    end
endmodule