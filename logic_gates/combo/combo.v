module combo (
  input a,
  input b,
  input c,
  input d,
  input e,
  output z
);
  assign z = ((a & b) | (c ^ d) & ~e);
endmodule
