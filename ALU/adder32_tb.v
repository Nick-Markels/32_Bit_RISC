`timescale 1ns / 1ns

module adder32_tb;

parameter WIDTH = 32;

reg    [WIDTH-1:0]   A, B;
wire   [WIDTH-1:0]   Sum;
wire                 Carry;

adder32 adder321 (Carry, Sum, A, B);

initial	// Test stimulus
  begin

    #10  A = 'h00000002; B = 'h0000000A; 
    #10  A = 'h6FFFFFFF;  B = 'h3FFFFFFF; 
    #10  A = 'h0077AA22;  B = 'hAB003410; 
    #10  A = 'h7FFFFFFF;  B = 'h7FFFFFFF;
    #10  A = 'h7FFFFFFF;  B = 'h8FFFFFFF; 
    #10  A = 'h7FFFFFFF;  B = 'h8FFFFFFF; 
    #10  A = 'h7FFFFFFF;  B = 'hCFFFFFFF;
    #10  A = 'h00479801;  B = 'h0088140A;
    #10  A = 'h07AAB689;  B = 'hA0B743BC;
    #10  A = 'h0077AA22;  B = 'hAB003410; 
    
 
     
    #10 $stop;
  end
  
initial
   begin
    $display("      time A  B  c_out sum "); 
    $monitor($stime,, A,,, B,,,  Carry,,,,,, Sum); 
   end

endmodule  