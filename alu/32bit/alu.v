module ALU (
  input [31:0] X,
  input [31:0] Y,
  input [3:0] sel,
  output reg [31:0] alu_out,
  output reg carry_out, borrow_out
);
always @(*) begin
  carry_out = 0;
  borrow_out = 0;
  case (sel)
    4'b0000: {carry_out, alu_out} = X + Y;
    4'b0001: begin
      alu_out = X - Y;
      borrow_out = (X < Y) ? 32'b1 : 32'b0;
    end
    4'b0010: alu_out = X * Y;
    4'b0011: begin
      if(Y != 0) alu_out = X / Y;
      else alu_out = 32'b1;
    end
    4'b0100: alu_out = X & Y;
    4'b0101: alu_out = X | Y;
    4'b0110: alu_out = X ^ Y;
    4'b0111: alu_out = ~X;
    4'b1000: alu_out = X >> Y;
    4'b1001: alu_out = X << Y;
    4'b1010: alu_out = (X == Y) ? 32'b1 : 32'b0;
    4'b1011: alu_out = (X != Y) ? 32'b1 : 32'b0;
    4'b1100: alu_out = (X > Y) ? 32'b1 : 32'b0;
    4'b1101: alu_out = (X < Y) ? 32'b1 : 32'b0;
    4'b1110: alu_out = 32'b1;
    4'b1111: alu_out = 32'b1;
    default: alu_out = 32'b1;
  endcase
end
endmodule
