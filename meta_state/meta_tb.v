module meta_tb;
  reg clk_fast, clk_slow, rst, async_signal;
  wire stable_signal;

  meta uut (
    .clk_fast(clk_fast),
    .clk_slow(clk_slow),
    .rst(rst),
    .async_signal(async_signal),
    .stable_signal(stable_signal)
  );

  always #5 clk_fast = ~clk_fast;
  always #20 clk_slow = ~clk_slow;

  initial begin
    clk_fast = 0;
    clk_slow = 0;
    rst = 1;
    async_signal = 0;

    #50 rst = 0;

    #55 async_signal = 1;
    #37 async_signal = 0;
    #82 async_signal = 1;
    #23 async_signal = 0;
    #60 async_signal = 1;
    #15 async_signal = 0;

    #500 $finish;
  end

  initial begin
    $dumpfile("meta.vcd");
    $dumpvars(0, meta_tb);
  end
endmodule
