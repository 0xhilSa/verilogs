`timescale 1ns/1ps
module Testbench;
  reg a;
  wire y;
  
  NOT_GATE uut(.a(a), .y(y));

  initial begin
    $dumpfile("not_wave.vcd");
    $dumpvars(0, Testbench);
    $monitor("a=%b | NOT GATE=%b", a, y);
    a = 0; #10;
    a = 1; #10;
    $finish;
  end
endmodule
