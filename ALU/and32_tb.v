`timescale 1ns / 1ns

module and32_tb;

parameter WIDTH = 32;

reg    [WIDTH-1:0]   A, B;
wire   [WIDTH-1:0]   Result;

and32 and320 (Result, A, B);

initial	// Test stimulus
  begin

    #10  A = 'h00000000; B = 'h00000000; 
    #10  A = 'h000000AA; B = 'h000000AA;
    #10  A = 'h000000AA; B = 'h000000AB;
    #10  A = 'hAB0000AA; B = 'h00CC00AA;
    #10  A = 'h00CD00AA; B = 'h23000023;
    #10  A = 'h1200BD67; B = 'h0DEF8944;
    #10  A = 'hDD8750BA; B = 'h98BDEF32;
    #10  A = 'hAAAAAAAA; B = 'hAAAAAAAA;
    #10  A = 'hAAAAAAAA; B = 'hDDDDDDDD;

     
    #10 $stop;
  end
  
initial
   begin
    $display("      time A  B  Result "); 
    $monitor($stime,, A,,, B,,,  Result,,,,,, ); 
   end

endmodule  

