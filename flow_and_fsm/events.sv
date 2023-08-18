/*
events are a static object used to sync concurrent processes
process triggers an event with -> or -->
process waits for event with @ or .triggered 
  always @ (negedge clk) would be triggered by event
*/

module event_example;

    // Declare an event
    event my_event;

    // First process
    initial begin
        // Wait for 5 time units
        #5;
        
        // Trigger the event
        -> my_event;
        
        $display("[%0t] Event triggered", $time);
    end

    // Second process
    initial begin
        // Wait for the event to be triggered
        @ (my_event);
        
        $display("[%0t] Event detected", $time);
    end

endmodule

