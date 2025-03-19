module TFF(
  input clk,
  input rst,
  input t,
  output reg Q
);
  always @(negedge clk or posedge rst) begin
    if (rst)
      Q <= 1'b0;
    else if (t)
      Q = ~Q;
  end
endmodule

module RIPPLER_COUNTER (
  input clk,
  input rst,
  output [3:0] Q
);
  wire Q0, Q1, Q2, Q3;

  TFF FF0 (.clk(clk), .rst(rst), .t(1'b1), .Q(Q0));
  TFF FF1 (.clk(Q0), .rst(rst), .t(1'b1), .Q(Q1));
  TFF FF2 (.clk(Q1), .rst(rst), .t(1'b1), .Q(Q2));
  TFF FF3 (.clk(Q2), .rst(rst), .t(1'b1), .Q(Q3));

  assign Q = {Q3, Q2, Q1, Q0};
endmodule
