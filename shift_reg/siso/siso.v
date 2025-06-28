module SISO #(
  parameter WIDTH = 4
)(
  input wire clk,
  input wire rst,
  input wire din,
  output wire dout
);
  reg [3:0] shift_reg;
  always @(posedge clk) begin
    if(rst) shift_reg <= 0;
    else shift_reg <= {shift_reg[2:0], din};
  end
  assign dout = shift_reg[3];
endmodule
