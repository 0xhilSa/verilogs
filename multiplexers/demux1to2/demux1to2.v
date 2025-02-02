module DEMUX1TO2 (
  input wire din,
  input wire sel,
  output wire dout0,
  output wire dout1
);
  assign dout0 = (sel == 0) ? din : 0;
  assign dout1 = (sel == 1) ? din : 0;
endmodule
