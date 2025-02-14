module D_LATCH (
  input D,
  output Q, Qbar
);
  assign Q = ~(D & Qbar);
  assign Qbar = ~(~D & Q);
endmodule
