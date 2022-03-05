`timescale 1ns / 1ns

module subtractor32_tb;

parameter WIDTH = 32;

reg    [WIDTH-1:0]   A, B;
wire   [WIDTH-1:0]   Diff;
wire                 Bout;

subtractor32 subtractor321 (Bout, Diff, A, B);

initial	// Test stimulus
  begin

  #10  A = 'h0000000A; B = 'h00000002;
  #10  A = 'h00000002; B = 'h0000000A;
  #10  A = 'h00000000; B = 'hFFFFFFFF;
  #10  A = 'h0AABB002; B = 'h0BB00002;
  #10  A = 'hFF0055AA; B = 'hCCAA8932;
  #10  A = 'h00CD0956; B = 'h0000000AA;
  #10  A = 'h00CD0956; B = 'h0011AAFF;
  #10  A = 'hAB000022; B = 'h00CC0022;
  #10  A = 'h0CFA67AB; B = 'h00CB0022;
  #10  A = 'h00FAFAFA; B = 'h0000FF22;
  #10  A = 'hFFFFFFFF; B = 'hAAAAAAAA;
  
     
    #10 $stop;
  end
  
initial
   begin
    $display("      time A  B  Bout Diff "); 
    $monitor($stime,, A,,, B,,,  Bout,,,,,, Diff); 
   end

endmodule  