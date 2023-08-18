// Basic Case

module my_module(input [1:0] sel, input [7:0] data_in, output [7:0] data_out);
  // Input sel is a 2-bit selector for the operation to be performed
  // Input data_in is the data to be operated on
  // Output data_out is the result of the operation

  // Define the operations for each selector value using a case statement
  case (sel)
    2'b00: // If sel is 00, perform a bitwise AND operation
      data_out = data_in & 8'h0F;
      // no break is needed
    2'b01: // If sel is 01, perform a bitwise OR operation
      data_out = data_in | 8'hF0;
    2'b10: // If sel is 10, perform a bitwise XOR operation
      data_out = data_in ^ 8'hFF;
    default: // If sel is any other value, perform a bitwise NOT operation
      data_out = ~data_in;
  endcase
endmodule

// Case in always

module my_module(input clk, input [1:0] sel, input [7:0] data_in, output reg [7:0] data_out);
  // Input clk is the clock signal
  // Input sel is a 2-bit selector for the operation to be performed
  // Input data_in is the data to be operated on
  // Output data_out is the result of the operation

  always @(posedge clk) begin
    // On each positive edge of the clock, perform the operation based on the value of sel
    case (sel)
      2'b00: // If sel is 00, perform a bitwise AND operation
        data_out <= data_in & 8'h0F;
      2'b01: // If sel is 01, perform a bitwise OR operation
        data_out <= data_in | 8'hF0;
      2'b10: // If sel is 10, perform a bitwise XOR operation
        data_out <= data_in ^ 8'hFF;
      default: // If sel is any other value, perform a bitwise NOT operation
        data_out <= ~data_in;
    endcase
  end
endmodule

// Case exampe for a Moore FSM
// Just depends on current state

module my_fsm(input clk, input reset, input data, output reg out);
  // Input clk is the clock signal // default value is a wire
  // Input reset is the reset signal
  // Input data is the input data
  // Output out is the output data

  // Define the states of the FSM using an enumerated data type
  // datatype state_type can only be the one of the listed types, ie s1,s2,s3
  typedef enum logic [1:0] {S0, S1, S2} state_type;
  state_type state, next_state; // Declare current and next state variables

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Initialize the FSM to the first state on reset
      state <= S0;
      out <= 1'b0;
    end else begin
      // Determine the next state based on the current state and input data
      case (state)
        S0: begin // If the FSM is in state S0
          if (data) begin // If the input data is high
            next_state <= S1; // Transition to state S1
            out <= 1'b1; // Set the output to high
          end else begin // If the input data is low
            next_state <= S0; // Stay in state S0
            out <= 1'b0; // Set the output to low
          end
        end
        S1: begin // If the FSM is in state S1
          if (data) begin // If the input data is high
            next_state <= S2; // Transition to state S2
            out <= 1'b0; // Set the output to low
          end else begin // If the input data is low
            next_state <= S1; // Stay in state S1
            out <= 1'b1; // Set the output to high
          end
        end
        S2: begin // If the FSM is in state S2
          next_state <= S0; // Transition back to state S0
          out <= 1'b0; // Set the output to low
        end
        default: begin // If the FSM is in any other state
          next_state <= S0; // Initialize the FSM to the first state
          out <= 1'b0; // Set the output to low
        end
      endcase
      
      state <= next_state; // Update the current state with the next state
    end
  end
endmodule

// Mealy depnds on present state and inputs

module mealy_fsm(
    input clk,
    input reset,
    input in,
    output reg out,
    output reg [1:0] state
);

// Define the states
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

// Define the next state and output functions
always @(state or in) begin
    case (state)
        S0: begin
            if (in) begin
                state <= S1;
                out <= 0;
            end else begin
                state <= S0;
                out <= 0;
            end
        end
        S1: begin
            if (in) begin
                state <= S2;
                out <= 0;
            end else begin
                state <= S0;
                out <= 1;
            end
        end
        S2: begin
            if (in) begin
                state <= S1;
                out <= 1;
            end else begin
                state <= S2;
                out <= 0;
            end
        end
    endcase
end

endmodule

// Another simple FSM
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) current_state <= IDLE;
    else current_state <= next_state;
end

always_comb begin
    case (current_state)
        IDLE:   next_state = START;
        START:  next_state = RUN;
        RUN:    next_state = STOP;
        STOP:   next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

//// better form to have ff and comb blocks
//// Moore FSM: Output depends on current state
//// Mealy FSM: Output depends on current state and inputs
//// D-Flip Flop is D = Input/Next State, Q = Current State

/// Moore
typedef enum {IDLE, GOT_1, DONE} moore_state_e;
moore_state_e current_state, next_state;

// Output declaration
logic dout;

// Sequential Logic (flip-flop) - State Update
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) current_state <= IDLE;
    else current_state <= next_state;
end

// Combinational Logic - Next State and Output Logic
always_comb begin
    next_state = current_state;
    dout = 0;  // default output value

    case (current_state)
        IDLE:   if (din) next_state = GOT_1;

        GOT_1:  begin
            if (!din) begin
                next_state = DONE;
                dout = 1;  // This is a Moore machine, so the output is set based on state
            end else begin
                next_state = IDLE;
            end
        end

        DONE:   if (din) next_state = GOT_1;

        default: next_state = IDLE;
    endcase
end

/// Mealy
typedef enum {IDLE, GOT_0} mealy_state_e;
mealy_state_e current_state, next_state;

// Output declaration
logic dout;

// Sequential Logic (flip-flop) - State Update
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) current_state <= IDLE;
    else current_state <= next_state;
end

// Combinational Logic - Next State and Output Logic
always_comb begin
    next_state = current_state;
    dout = 0;  // default output value

    case (current_state)
        IDLE:   if (!din) next_state = GOT_0;

        GOT_0:  begin
            if (din) begin
                dout = 1;  // Mealy machine, output is set based on input transition
            end
            next_state = din ? IDLE : GOT_0;
        end

        default: next_state = IDLE;
    endcase
end

