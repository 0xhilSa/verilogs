module FULL_ADDER (
  input a, b, cin,
  output sum, cout
);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module RCA #(
  parameter N = 4
)(
  input [N-1:0] a, b,
  input cin,
  output [N-1:0] sum,
  output cout
);
  wire [N:0] carry;
  assign carry[0] = cin;
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : FA_LOOP
      FULL_ADDER FA (
        .a(a[i]),
        .b(b[i]),
        .cin(carry[i]),
        .sum(sum[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate
  assign cout = carry[N];
endmodule
