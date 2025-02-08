`timescale 1ns / 1ps

module DECODER3TO8_TB;
  reg a, b, c;
  wire d0, d1, d2, d3, d4, d5, d6, d7;

  DECODER3TO8 uut (
    .a(a),
    .b(b),
    .c(c),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
  );

  initial begin
    $dumpfile("decoder3to8_tb.vcd");
    $dumpvars(0, DECODER3TO8_TB);
    {a, b, c} = 3'b000; #10;
    {a, b, c} = 3'b001; #10;
    {a, b, c} = 3'b010; #10;
    {a, b, c} = 3'b011; #10;
    {a, b, c} = 3'b100; #10;
    {a, b, c} = 3'b101; #10;
    {a, b, c} = 3'b110; #10;
    {a, b, c} = 3'b111; #10;
    $finish;
  end
  initial begin
    $monitor("Time = %0t | a = %b, b = %b, c = %b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b", $time, a, b, c, d0, d1, d2, d3, d4, d5, d6, d7);
  end
endmodule
