module WAVE_TB;
  reg wave;

  WAVE uut (.wave(wave));
 
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,WAVE_TB);
    wave = 0; #10 wave = 1; #30 wave = 0; #40 wave = 1; #10 wave = 0;
    $finish;
  end
endmodule

