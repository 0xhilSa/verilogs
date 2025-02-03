module Testbench;
  reg d, clk, rst;
  wire Q;

  D uut (.d(d), .clk(clk), .rst(rst), .Q(Q));

  always #5 clk = ~clk;
  initial begin
    $dumpfile("d.vcd");
    $dumpvars(0, Testbench);
    clk = 0; rst = 1; d = 0;
    #10 rst = 0; d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 rst = 1; // Reset
    #10 rst = 0; d = 0;
    #10 d = 1;
    #20 $finish;
  end
endmodule
