module ALU (
  input [7:0] A, B,
  input [3:0] opcode,
  output reg [7:0] result
);
  always @(*) begin
    case (opcode)
      4'b0000: result <= A + B;           // add ops
      4'b0001: result <= A - B;           // sub ops
      4'b0010: result <= A & B;           // and ops
      4'b0011: result <= A | B;           // or ops
      4'b0100: result <= A ^ B;           // xor ops
      default: result <= 8'b0000_0000;    // 0 value (default)
    endcase
  end
endmodule

module Registers (
  input clk,
  input [3:0] read_reg1, read_reg2, write_reg,
  input [7:0] write_data,
  input reg_write,
  output [7:0] read_data1, read_data2
);
  reg [7:0] registers [15:0];

  always @(*) begin
    read_data1 = registers[read_reg1];
    read_data2 = registers[read_reg2];
  end

  always @(posedge clk) begin
    if (reg_write)
      registers[write_reg] <= write_data;
  end
endmodule
