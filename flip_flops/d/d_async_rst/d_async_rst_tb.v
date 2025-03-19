module D_TB;
  reg clk;
  reg rst_n;
  reg d;
  wire q;

  D uut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("d.vcd");
    $dumpvars(0, D_TB);
    clk = 0;
    rst_n = 0;
    d = 0;
    #10;
    
    rst_n = 1;
    #10;

    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    rst_n = 0; #10;
    rst_n = 1; #10;

    d = 0; #10;
    d = 1; #10;

    $finish;
  end
endmodule
