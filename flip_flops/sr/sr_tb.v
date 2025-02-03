`timescale 1ns/1ps
module Testbench;
  reg S, R, CLK;
  wire Q, Qn;

  SR uut (
    .S(S),
    .R(R),
    .CLK(CLK),
    .Q(Q),
    .Qn(Qn)
  );

  always #5 CLK = ~CLK;

  initial begin
    CLK = 0;
    S = 0;
    R = 0;

    $dumpfile("sr.vcd");
    $dumpvars(0, Testbench);

    #10 S = 1; R = 0;
    #10 S = 0; R = 1;
    #10 S = 1; R = 1;
    #10 S = 0; R = 0;
    #10 S = 1; R = 0;
    #10 S = 0; R = 1;
    #10 S = 1; R = 1;
    #10 $finish;
  end
  initial begin
    $monitor("Time=%0t | S=%b | R=%b | CLK=%b | Q=%b | Qn=%b", $time, S, R, CLK, Q, Qn);
  end
endmodule
