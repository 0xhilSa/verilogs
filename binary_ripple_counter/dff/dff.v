module DFF (
  input clk,
  input rst,
  input d,
  output reg Q
);
  always @(negedge clk or posedge rst) begin
    if (rst)
      Q <= 1'b0;
    else
      Q <= d;
  end
endmodule

module RIPPLE_COUNTER (
  input clk,
  input rst,
  output [3:0] Q
);
  wire Q0, Q1, Q2, Q3;
  
  DFF FF0 (.clk(clk), .rst(rst), .d(~Q0), .Q(Q0));
  DFF FF1 (.clk(Q0), .rst(rst), .d(~Q1), .Q(Q1));
  DFF FF2 (.clk(Q1), .rst(rst), .d(~Q2), .Q(Q2));
  DFF FF3 (.clk(Q2), .rst(rst), .d(~Q3), .Q(Q3));

  assign Q = {Q3, Q2, Q1, Q0};
endmodule
