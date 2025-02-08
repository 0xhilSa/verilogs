module DECODER3TO8 (
  input wire a,
  input wire b,
  input wire c,
  output wire d0,
  output wire d1,
  output wire d2,
  output wire d3,
  output wire d4,
  output wire d5,
  output wire d6,
  output wire d7
);

  assign d0 = (~a & ~b & ~c);
  assign d1 = (~a & ~b &  c);
  assign d2 = (~a &  b & ~c);
  assign d3 = (~a &  b &  c);
  assign d4 = ( a & ~b & ~c);
  assign d5 = ( a & ~b &  c);
  assign d6 = ( a &  b & ~c);
  assign d7 = ( a &  b &  c);
endmodule
