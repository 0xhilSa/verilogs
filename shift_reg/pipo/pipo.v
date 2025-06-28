module PIPO(
  input wire [3:0] ins,
  input clk,
  output wire [3:0] outs
);

  DFF dff0 (.clk(clk), .d(ins[0]), .q(outs[0]));
  DFF dff1 (.clk(clk), .d(ins[1]), .q(outs[1]));
  DFF dff2 (.clk(clk), .d(ins[2]), .q(outs[2]));
  DFF dff3 (.clk(clk), .d(ins[3]), .q(outs[3]));

endmodule

