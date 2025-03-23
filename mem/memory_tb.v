module Memory_TB;
  reg enable, readwrite;
  reg [3:0] dataIn;
  reg [5:0] address;
  wire [3:0] dataOut;

  Memory uut (
    .enable(enable),
    .readwrite(readwrite),
    .dataIn(dataIn),
    .address(address),
    .dataOut(dataOut)
  );

  initial begin
    enable = 0;
    readwrite = 0;
    dataIn = 4'b0;
    address = 6'b0;

    #10;

    enable = 1;
    readwrite = 0;  // write mode
    address = 6'b000001; dataIn = 4'b1010; #10;
    address = 6'b000010; dataIn = 4'b1100; #10;
    address = 6'b000011; dataIn = 4'b0101; #10;

    readwrite = 1;  // read mode
    address = 6'b000001; #10;
    $display("read data at Address %d: %b", address, dataOut);

    address = 6'b000010; #10;
    $display("read data at Address %d: %b", address, dataOut);
    
    address = 6'b000011; #10;
    $display("read data at Address %d: %b", address, dataOut);

    enable = 0;
    address = 6'b000001; #10;
    $display("when disabled, read data at Address %d: %b", address, dataOut);

    #10;
    $finish;
  end
endmodule
