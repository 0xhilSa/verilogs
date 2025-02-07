module FULL_ADDER_TB;
  reg a, b, cin;
  wire sum, cout;

  FULL_ADDER uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, FULL_ADDER_TB);
    $monitor("A=%b, B=%b, CIN=%b | SUM=%b, COUT=%b", a, b, cin, sum, cout);
    a = 0; b = 0; cin = 0; #10;
    a = 0; b = 0; cin = 1; #10;
    a = 0; b = 1; cin = 0; #10;
    a = 0; b = 1; cin = 1; #10;
    a = 1; b = 0; cin = 0; #10;
    a = 1; b = 0; cin = 1; #10;
    a = 1; b = 1; cin = 0; #10;
    a = 1; b = 1; cin = 1; #10;
    $finish;
  end
endmodule
