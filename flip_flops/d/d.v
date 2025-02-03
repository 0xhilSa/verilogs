module D (
  input wire d,
  input wire clk,
  input wire rst,
  output reg Q
);
  always @(posedge clk) begin
    if(rst)
      Q <= 0;
    else
      Q <= d;
  end
endmodule
