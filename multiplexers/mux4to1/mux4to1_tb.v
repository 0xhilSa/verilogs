module Testbench;
  reg [1:0] sel;
  reg d0, d1, d2, d3;
  wire y;

  MUX4TO1 uut (
    .sel(sel),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .y(y)
  );

  initial begin
    $dumpfile("mux4to1_tb.vcd");
    $dumpvars(0, Testbench);
    $monitor("Time=%0t | sel=%b | d0=%b d1=%b d2=%b d3=%b | y=%b", $time, sel, d0, d1, d2, d3, y);
    d0 = 0; d1 = 1; d2 = 0; d3 = 1;
    
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    $finish;
  end
endmodule