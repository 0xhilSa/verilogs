module Testbench;
  reg clk, rst;
  wire [3:0] Q;

  RIPPLE_COUNTER uut (.clk(clk), .rst(rst), .Q(Q));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0,Testbench);
    $monitor("Time=%0t | Q=%b", $time, Q);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #200 $finish;
  end
endmodule
