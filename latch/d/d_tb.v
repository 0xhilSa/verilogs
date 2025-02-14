module D_TB;
  reg D;
  wire Q, Qbar;

  D_LATCH uut (.D(D), .Q(Q), .Qbar(Qbar));

  initial begin
    $dumpfile("d.vcd");
    $dumpvars(0, D_TB);
    $monitor("Time=%0t, D=%b, Q=%b, Qbar=%b", $time, D, Q, Qbar);

    D = 1; #10;
    D = 0; #10;
    D = 0; #10;
    D = 1; #10;
    D = 0; #10;
    $finish;
  end
endmodule
