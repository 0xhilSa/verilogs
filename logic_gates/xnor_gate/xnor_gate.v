module XNOR_GATE (input a, input b, output y);
  assign y = ~(a ^ b);
endmodule
