module meta (
  input wire clk_fast,
  input wire clk_slow,
  input wire rst,
  input wire async_signal,
  output reg stable_signal
);

  reg meta_ff;
  reg sync_ff;

  reg fast_signal;
  always @(posedge clk_fast or posedge rst) begin
    if (rst)
      fast_signal <= 0;
    else
      fast_signal <= async_signal;
  end

  always @(posedge clk_slow or posedge rst) begin
    if (rst) begin
      meta_ff  <= 0;
      sync_ff  <= 0;
      stable_signal <= 0;
    end else begin
      meta_ff  <= fast_signal;
      sync_ff  <= meta_ff;
      stable_signal <= sync_ff;
    end
  end
endmodule
