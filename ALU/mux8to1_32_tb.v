`timescale 1ns / 1ns

module mux8to1_32_tb;

parameter WIDTH = 32;

reg [WIDTH-1:0] A, B, C, D, E, F, G, H;
reg S2, S1, S0;
wire [WIDTH-1:0] Out;

mux8to1_32 mux8to1_320(Out, S2, S1, S0, A, B, C, D, E, F, G, H);

initial	// Test stimulus
  begin
  
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  0; S1 =  0; S0 =  0;
   #10  A = 'hFFF00045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  0; S1 =  0; S0 =  0;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  0; S1 =  0; S0 =  1;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  0; S1 =  1; S0 =  0;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  0; S1 =  1; S0 =  1;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  1; S1 =  0; S0 =  0;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  1; S1 =  0; S0 =  1;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  1; S1 =  1; S0 =  0;
   #10  A = 'h00000045; B =  'hAB000002; C =  'h00C45008; D =  'h00000002; E =  'hAACDFF23; F =  'h00000002; G =  'h00F00002; H =  'h00CF0002; S2 =  1; S1 =  1; S0 =  1;
   
 #10 $stop;
  end


initial
   begin
    $display("      time A B C D E F G H S2 S1 S0 Out");
    $monitor($stime,, A,,, B,,, C,,, D,,, E,,, F,,, G,,, H,,, S2,,, S1,,, S0,,, Out);
   end

endmodule  