module HALF_ADDER_TB;
  reg a, b;
  wire sum, cout;

  HALF_ADDER uut (.a(a), .b(b), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, HALF_ADDER_TB);
    $monitor("A=%b, B=%b | SUM=%b, COUT=%b", a, b, sum, cout);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end
endmodule
