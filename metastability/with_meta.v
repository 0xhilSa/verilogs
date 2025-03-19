module with_meta(
  input wire clk,
  input wire async_sig,
  output reg q
);
  always @(posedge clk) begin
    q <= async_sig;
  end
endmodule
