module reg_file(
  input wire clk,
  input wire we,
  input wire [2:0] wr_addr,
  input wire [7:0] wr_data,
  input wire [2:0] rd_addr1,
  input wire [2:0] rd_addr2,
  output wire [7:0] rd_data1,
  output wire [7:0] rd_data2
);
  reg [7:0] reg_array [7:0];

  always @(posedge clk) begin
    if(we) reg_array[wr_addr] <= wr_data;
  end

  assign rd_data1 = reg_array[rd_addr1];
  assign rd_data2 = reg_array[rd_addr2];
endmodule
