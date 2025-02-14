module det_1011 (
  input wire clk,
  input wire reset,
  input wire in_bit,
  output reg detected
);

  parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b111;
  reg [2:0] current_state, next_state;

  always @(*) begin
    case (current_state)
      S0: next_state = (in_bit) ? S1 : S0;
      S1: next_state = (in_bit) ? S1 : S2;
      S2: next_state = (in_bit) ? S3 : S0;
      S3: next_state = (in_bit) ? S4 : S2;
      S4: next_state = (in_bit) ? S1 : S2;
      default: next_state = S0;
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) current_state <= S0;
    else current_state <= next_state;
  end

  always @(posedge clk or posedge reset) begin
    if (reset) detected <= 0;
    else detected <= (next_state == S4);
  end
endmodule
