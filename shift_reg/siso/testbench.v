module Testbench;
  reg clk;
  reg din;
  wire dout;

  SISO uut(
    .clk(clk),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    din = 0;

    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #50 $finish;
  end

  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, Testbench);
  end
endmodule
