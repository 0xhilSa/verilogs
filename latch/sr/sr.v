module SR (
  input S, R,
  output reg Q, Qbar
);
  always @(*) begin
    case ({S, R})
      2'b00: ;
      2'b01: begin Q = 0; Qbar = 1; end
      2'b10: begin Q = 1; Qbar = 0; end
      2'b11: begin Q = 1'bx; Qbar = 1'bx; end
    endcase
  end
endmodule
