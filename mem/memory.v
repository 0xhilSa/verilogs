module Memory (
  input enable, readwrite,
  input [3:0] dataIn,
  input [5:0] address,
  output reg [3:0] dataOut
);

  reg [3:0] mem [0:63];
  always @(*) begin
    if(enable) begin
      if (readwrite)
        dataOut = mem[address];
      else
        mem[address] = dataIn;
    end else
      dataOut = 4'bz;
  end
endmodule
