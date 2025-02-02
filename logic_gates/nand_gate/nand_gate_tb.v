`timescale 1ns/1ps
module Testbench;
  reg a, b;
  wire y;

  NAND_GATE uut (.a(a), .b(b), .y(y));

  initial begin
    $dumpfile("nand_gate.vcd");
    $dumpvars(0, Testbench);
    $monitor("a=%b b=%b | NAND Output=%b", a, b, y);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end
endmodule
