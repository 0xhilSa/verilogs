module Testbench;
  reg din;
  reg [1:0] sel;
  wire y0, y1, y2, y3;

  DEMUX1TO4 uut (
    .din(din),
    .sel(sel),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
  );

  initial begin
    $dumpfile("demux1to4.vcd");
    $dumpvars(0, Testbench);
    $monitor("Time=%0t | din=%b | sel=%b | y0=%b, y1=%b, y2=%b, y3=%b", $time, din, sel, y0, y1, y2, y3);
    din = 1;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
    $finish;
  end
endmodule
