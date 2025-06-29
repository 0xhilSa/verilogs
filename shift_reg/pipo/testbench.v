module Testbench;
  reg clk;
  reg [3:0] ins;
  wire [3:0] outs;

  PIPO uut (
    .clk(clk),
    .ins(ins),
    .outs(outs)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    ins = 4'b0;

    #10 ins = 4'b1010;
    #10 ins = 4'b1100;
    #10 ins = 4'b0111;
    #10 ins = 4'b0001;

    #10 ins = 4'b0000;
    #10 ins = 4'b0001;
    #10 ins = 4'b0010;
    #10 ins = 4'b0011;
    #10 ins = 4'b0100;
    #10 ins = 4'b0101;
    #10 ins = 4'b0110;
    #10 ins = 4'b0111;
    #10 ins = 4'b1000;
    #10 ins = 4'b1001;
    #10 ins = 4'b1010;
    #10 ins = 4'b1011;
    #10 ins = 4'b1100;
    #10 ins = 4'b1101;
    #10 ins = 4'b1110;
    #10 ins = 4'b1111;
    #20 $finish;
  end

  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(0, Testbench);
    $monitor("time: %0t | clk = %b | ins = %b | outs = %b", $time, clk, ins, outs);
  end
endmodule
