module ENDS_WITH_0_TB;
  reg clk, rst, in;
  wire accept;

  ENDS_WITH_0 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .accept(accept)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    in = 0;
    #10;

    rst = 0;
    #10;

    // sequence 1100 should be accepted
    in = 1; #10;
    in = 1; #10;
    in = 0; #10;
    in = 0; #10;

    // sequence 1011 shouldn't be accepted
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;

    // sequence 100 should be accepted
    in = 1; #10;
    in = 0; #10;
    in = 0; #10;

    // sequence 11 shouldn't be accepted
    in = 1; #10;
    in = 1; #10;
    $finish;
  end

  initial begin
    $dumpfile("ends_with_0.vcd");
    $dumpvars(0, ENDS_WITH_0_TB);
  end
endmodule
