module SR_TB;
  reg S, R;
  wire Q, Qbar;

  SR uut (.S(S), .R(R), .Q(Q), .Qbar(Qbar));

  initial begin
    $dumpfile("sr.vcd");
    $dumpvars(0, SR_TB);
    $monitor("Time=%0t, S=%b, R=%b, Q=%b, Qbar=%b", $time, S, R, Q, Qbar);

    S = 1; R = 1; #10;
    S = 0; R = 0; #10;
    S = 0; R = 1; #10;
    S = 1; R = 0; #10;
    S = 0; R = 0; #10;
    $finish;
  end
endmodule
