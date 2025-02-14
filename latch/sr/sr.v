module SR (
  input S, R,
  output Q, Qbar
);
  assign Q = ~(S & Qbar);
  assign Qbar = ~(R & Q);
endmodule
