module RCA_TB;
  parameter N = 4;
  reg [N-1:0] a, b;
  reg cin;
  wire [N-1:0] sum;
  wire cout;

  RCA #(N) uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("rca.vcd");
    $dumpvars(0, RCA_TB);
    $monitor("Time=%0t a=%b, b=%b, cin=%b | sum=%b, cout=%b", $time, a, b, cin, sum, cout);

    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    a = 4'b0001; b = 4'b0001; cin = 0; #10;
    a = 4'b0011; b = 4'b0001; cin = 0; #10;
    a = 4'b1010; b = 4'b0101; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1111; b = 4'b1111; cin = 1; #10;
    $finish;
  end
endmodule
