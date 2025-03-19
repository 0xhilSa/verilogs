module seq_ckt_tb;
  reg clk, x;
  reg y;

  seq_ckt uut (
    .clk(clk),
    .x(x),
    .y(y)
  );

  always #10 clk = ~clk;

  initial begin
    $dumpfile("seq_ckt.vcd");
    $dumpvars(0, seq_ckt_tb);
    clk = 0;
    x = 0;

    #20 x = 1;
    #20 x = 0;
    #20 x = 1;
    #20 x = 1;
    #20 x = 0;
    #20 x = 1;
    #20 x = 0;
    #20 x = 1;

    #50 $finish;
  end
  initial begin
    $monitor("Time = %0t | x = %b | y = %b", $time, x ,y);
  end
endmodule
