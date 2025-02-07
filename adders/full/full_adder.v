module FULL_ADDER(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  wire and_res = a & b;
  wire xor_res = a ^ b;
  assign sum = xor_res ^ cin;
  assign cout = and_res | (xor_res & cin);
endmodule
