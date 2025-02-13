module ALU_TB;
  reg [15:0] X, Y;
  reg [2:0] sel;
  wire [15:0] alu_out;
  wire carry_out;
  wire borrow_out;

  // Instantiate the ALU module
  ALU uut (
    .X(X),
    .Y(Y),
    .sel(sel),
    .alu_out(alu_out),
    .carry_out(carry_out),
    .borrow_out(borrow_out)
  );
  
  initial begin
    $dumpfile("alu.vcd");  // For waveform analysis
    $dumpvars(0, ALU_TB);

    // Test Case 1: Addition without carry
    X = 16'h0001; Y = 16'h0001; sel = 3'b000; #10;
    $display("ADD: X=%h, Y=%h, sel=%b, alu_out=%h, carry_out=%b, borrow_out=%b", X, Y, sel, alu_out, carry_out, borrow_out);

    // Test Case 2: Addition with carry (overflow case)
    X = 16'hFFFF; Y = 16'h0001; sel = 3'b000; #10;
    $display("ADD OVERFLOW: X=%h, Y=%h, sel=%b, alu_out=%h, carry_out=%b, borrow_out=%b", X, Y, sel, alu_out, carry_out, borrow_out);

    // Test Case 3: Subtraction without borrow
    X = 16'h0005; Y = 16'h0002; sel = 3'b001; #10;
    $display("SUB: X=%h, Y=%h, sel=%b, alu_out=%h, borrow_out=%b", X, Y, sel, alu_out, borrow_out);

    // Test Case 4: Subtraction with borrow (X < Y)
    X = 16'h0001; Y = 16'h0002; sel = 3'b001; #10;
    $display("SUB (WITH BORROW): X=%h, Y=%h, sel=%b, alu_out=%h, borrow_out=%b", X, Y, sel, alu_out, borrow_out);

    // Test Case 5: Bitwise AND
    X = 16'h0F0F; Y = 16'hF0F0; sel = 3'b010; #10;
    $display("AND: X=%h, Y=%h, sel=%b, alu_out=%h", X, Y, sel, alu_out);

    // Test Case 6: Bitwise OR
    X = 16'h0F0F; Y = 16'hF0F0; sel = 3'b011; #10;
    $display("OR: X=%h, Y=%h, sel=%b, alu_out=%h", X, Y, sel, alu_out);

    // Test Case 7: Bitwise XOR
    X = 16'hAAAA; Y = 16'h5555; sel = 3'b100; #10;
    $display("XOR: X=%h, Y=%h, sel=%b, alu_out=%h", X, Y, sel, alu_out);

    // Test Case 8: Bitwise NOT (Y is ignored)
    X = 16'h1234; sel = 3'b101; #10;
    $display("NOT: X=%h, sel=%b, alu_out=%h", X, sel, alu_out);

    // Test Case 9: Left Shift
    X = 16'h0001; sel = 3'b110; #10;
    $display("LSHIFT: X=%h, sel=%b, alu_out=%h", X, sel, alu_out);

    // Test Case 10: Right Shift
    X = 16'h8000; sel = 3'b111; #10;
    $display("RSHIFT: X=%h, sel=%b, alu_out=%h", X, sel, alu_out);

    $finish;
  end
endmodule
