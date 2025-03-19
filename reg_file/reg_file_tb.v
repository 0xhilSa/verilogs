module reg_file_tb;
  reg clk;
  reg we;
  reg [2:0] wr_addr, rd_addr1, rd_addr2;
  reg [7:0] wr_data;
  wire [7:0] rd_data1, rd_data2;

  reg_file uut (
    .clk(clk),
    .we(we),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),
    .rd_data1(rd_data1),
    .rd_data2(rd_data2)
  );
  
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    we = 1;

    wr_addr = 3'b001; wr_data = 8'hA5; #10;
    wr_addr = 3'b010; wr_data = 8'h5A; #10;

    we = 0;

    rd_addr1 = 3'b001; rd_addr2 = 3'b010; #10;

    $display("reg 1: %h", rd_data1);
    $display("reg 2: %h", rd_data2);
    $finish;
  end
endmodule
