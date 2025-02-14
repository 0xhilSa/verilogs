module JK_TB;
  reg CLK, J, K;
  wire Q, Qbar;

  JK uut (.CLK(CLK), .J(J), .K(K), .Q(Q), .Qbar(Qbar));

  initial begin
    CLK = 0; J = 0; K = 0; #10;
    J = 1; K = 0; #10;
    J = 0; K = 0; #10;
    J = 1; K = 1; #10;
    J = 1; K = 1; #10;
    J = 0; K = 0; #10;
    $finish;
  end

  always  #5 CLK = ~CLK;

  initial begin
    $dumpfile("jk.vcd");
    $dumpvars(0, JK_TB);
  end
endmodule
