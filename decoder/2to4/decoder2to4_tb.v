module DECODER2TO4_TB;
  reg a, b;
  wire d0, d1, d2, d3;

  DECODER2TO4 uut (
    .a(a),
    .b(b),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
  );

  initial begin
    $dumpfile("decoder2to4.vcd");
    $dumpvars(0, DECODER2TO4_TB);
    $display("Time\t a b | d0 d1 d2 d3");
    $monitor("%0t\t %b %b | %b  %b  %b  %b", $time, a, b, d0, d1, d2, d3);
    a = 0; b = 0; #10; 
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end
endmodule
