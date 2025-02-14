module det_1011_tb;
  reg clk, reset, in_bit;
  wire detected;

  det_1011 uut (
    .clk(clk),
    .reset(reset),
    .in_bit(in_bit),
    .detected(detected)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("det_1011.vcd");
    $dumpvars(0, det_1011_tb);
    $monitor("Time: %0t | in_bit: %b | detected: %b", $time, in_bit, detected);

    clk = 0;
    reset = 1;
    in_bit = 0;

    #10 reset = 0;
    #10 in_bit = 1;
    #10 in_bit = 0;
    #10 in_bit = 1;
    #10 in_bit = 1;
    #10 in_bit = 0;

    #10 in_bit = 1;
    #10 in_bit = 0;
    #10 in_bit = 1;
    #10 in_bit = 1;
    #10 in_bit = 1;
    #10 in_bit = 0;
    #10 in_bit = 1;
    #10 in_bit = 1;

    #20 $finish;
  end
endmodule
