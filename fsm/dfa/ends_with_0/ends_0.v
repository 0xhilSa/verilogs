// Deterministic Finite Automaton (DFA)
// Accepts binary string that ends with the 0

module ENDS_WITH_0(
  input clk,              // clock signal
  input rst,              // reset signal
  input in,               // input binary bit
  output reg accept       // output signal indicating if string ends with 0 or not!
);
  parameter S0 = 1'b0, S1 = 1'b1;
  reg state, next_state;

  always @(posedge clk or posedge rst) begin
    if (rst) state <= S0;
    else state <= next_state;
  end

  always @(*) begin
    case (state)
      S0: next_state = (in == 0) ? S0 : S1;
      S1: next_state = (in == 0) ? S0 : S1;
      default: next_state = S0;
    endcase
  end

  always @(*) begin
    accept = (state == S0);
  end
endmodule
