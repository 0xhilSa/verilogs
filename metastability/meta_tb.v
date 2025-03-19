module testbench;
  reg clk = 0;
  reg async_sig = 0;
  wire q_meta, q_sync;

  with_meta uut1 (.clk(clk), .async_sig(async_sig), .q(q_meta));
  without_meta uut2 (.clk(clk), .async_sig(async_sig), .q(q_sync));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);

    #7 async_sig = 1;
    #13 async_sig = 0;
    #17 async_sig = 0;
    #19 async_sig = 1;
    #31 async_sig = 1;
    #100 $finish;

  end
endmodule
