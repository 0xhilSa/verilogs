module ALU (
  input [15:0] X,
  input [15:0] Y,
  input [2:0] sel,
  output reg [15:0] alu_out,
  output reg carry_out, borrow_out
);
always @(*) begin
  carry_out = 0;
  borrow_out = 0;
  case (sel)
    3'b000: {carry_out, alu_out} = X + Y;
    3'b001: begin
      alu_out = X - Y;
      borrow_out = (X < Y) ? 1 : 0;
    end
    3'b010: alu_out = X & Y;
    3'b011: alu_out = X | Y;
    3'b100: alu_out = X ^ Y;
    3'b101: alu_out = ~X;
    3'b110: alu_out = X << 1;
    3'b111: alu_out = X >> 1;
    default: alu_out = 16'b0;
  endcase
end
endmodule
