module SR (
  input wire S,
  input wire R,
  input wire CLK,
  output reg Q,
  output reg Qn
);
  initial begin
    Q = 1'b0;
    Qn = 1'b0;
  end

  always @(posedge CLK) begin
    if (S & R) begin
      Q <= 1'bx;
      Qn <= 1'bx;
    end
    else if (S) begin
      Q <= 1'b1;
      Qn <= 1'b0;
    end
    else if (R) begin
      Q <= 1'b0;
      Qn <= 1'b1;
    end
  end
endmodule
