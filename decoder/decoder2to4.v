module DECODER2TO4(
  input wire a,
  input wire b,
  output wire d0,
  output wire d1,
  output wire d2,
  output wire d3
);
  assign d0 = ~a & ~b;
  assign d1 = ~a & b;
  assign d2 = a & ~b;
  assign d3 = a & b;
endmodule
