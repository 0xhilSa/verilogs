module seq_ckt (
  input wire clk,
  input wire x,
  output reg y
);
  reg A, B;
  always @(posedge clk) begin
    A <= (A & x) | (B & x);
    B <= (A & x) | (~B & x);
  end

  assign y = A & B;
endmodule
