module without_meta(
  input wire clk,
  input wire async_sig,
  output reg q
);
  reg q1;

  always @(posedge clk) begin
    q1 <= async_sig;
    q <= q1;
  end
endmodule
