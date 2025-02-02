`timescale 1ns/1ps
module Testbench;
  reg din;
  reg sel;
  wire dout0;
  wire dout1;

  DEMUX1TO2 uut (
    .din(din),
    .sel(sel),
    .dout0(dout0),
    .dout1(dout1)
  );

  initial begin
    $monitor("Time = %0t | din = %d | sel = %b | dout0 = %b | dout1 = %b", $time, din, sel, dout0, dout1);
    $dumpfile("demux1to2.vcd");
    $dumpvars(0, Testbench);
    din = 1;
    sel = 0; #10;
    sel = 1; #10;
    
    din = 0;
    sel = 0; #10;
    sel = 1; #10;
    $finish;
  end
endmodule
