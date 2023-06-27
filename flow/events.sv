events are a static object used to sync concurrent processes
process triggers an event with -> or -->
process waits for event with @ or .triggered 
  always @ (negedge clk) would be triggered by event
