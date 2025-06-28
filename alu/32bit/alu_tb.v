`timescale 1ns/1ps

module tb_alu;
  reg  [31:0] X;
  reg  [31:0] Y;
  reg  [3:0]  sel;
  wire [31:0] alu_out;
  wire carry_out, borrow_out;

  ALU uut (
    .X(X),
    .Y(Y),
    .sel(sel),
    .alu_out(alu_out),
    .carry_out(carry_out),
    .borrow_out(borrow_out)
  );

  task show;
    input [255:0] op_name;
    begin
      #1;
      $display("[%s] X = %d, Y = %d -> Out = %d, Carry = %b, Borrow = %b", op_name, X, Y, alu_out, carry_out, borrow_out);
    end
  endtask

  initial begin
    $display("---- Starting ALU Testbench ----");

    X = 100; Y = 50; sel = 4'b0000; #5; show("ADD");

    X = 50; Y = 100; sel = 4'b0001; #5; show("SUB");

    X = 10; Y = 20; sel = 4'b0010; #5; show("MUL");

    X = 100; Y = 25; sel = 4'b0011; #5; show("DIV");

    X = 32'hFFFF0000; Y = 32'h0000FFFF; sel = 4'b0100; #5; show("AND");

    X = 32'hFFFF0000; Y = 32'h0000FFFF; sel = 4'b0101; #5; show("OR");

    X = 32'hAAAA5555; Y = 32'h5555AAAA; sel = 4'b0110; #5; show("XOR");

    X = 32'hFFFFFFFF; Y = 0; sel = 4'b0111; #5; show("NOT");

    X = 32'hF0000000; Y = 4; sel = 4'b1000; #5; show("SHR");

    X = 32'h0000000F; Y = 4; sel = 4'b1001; #5; show("SHL");

    X = 1234; Y = 1234; sel = 4'b1010; #5; show("EQ");

    X = 1234; Y = 4321; sel = 4'b1011; #5; show("NEQ");

    X = 50; Y = 20; sel = 4'b1100; #5; show("GT");

    X = 10; Y = 100; sel = 4'b1101; #5; show("LT");

    sel = 4'b1110; #5; show("SEL=1110");

    sel = 4'b1111; #5; show("SEL=1111");

    sel = 4'bxxxx; #5; show("Invalid");

    $display("---- Testbench Complete ----");
    $finish;
  end

endmodule

