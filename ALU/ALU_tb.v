`timescale 1ns / 1ns

module ALU_tb;

parameter WIDTH = 32;

reg    [WIDTH-1:0]   A, B;
reg	   [3:0] I;
wire   [WIDTH-1:0]   Result;

ALU ALU1(Result, I, A, B);

initial	// Test stimulus
  begin
  
  //test adder
    #10  I = 'h0; A = 'h5; B = 'h5; 
	#10  I = 'h0; A = 'h00000002; B = 'h0000000A; 
    #10  I = 'h0; A = 'h6FFFFFFF;  B = 'h3FFFFFFF; 
    #10  I = 'h0; A = 'h0077AA22;  B = 'hAB003410; 
    #10  I = 'h0;A = 'h7FFFFFFF;  B = 'h7FFFFFFF;
    #10  I = 'h0; A = 'h7FFFFFFF;  B = 'h8FFFFFFF; 
    #10  I = 'h0; A = 'h7FFFFFFF;  B = 'h8FFFFFFF; 
    #10  I = 'h0; A = 'h7FFFFFFF;  B = 'hCFFFFFFF;
    #10  I = 'h0; A = 'h00479801;  B = 'h0088140A;
    #10  I = 'h0; A = 'h07AAB689;  B = 'hA0B743BC;
    #10  I = 'h0; A = 'h0077AA22;  B = 'hAB003410; 


	//test subtractor
	
  #10  I = 'h1; A = 'h0000000A; B = 'h00000002;
  #10  I = 'h1; A = 'h00000002; B = 'h0000000A;
  #10  I = 'h1; A = 'h00000000; B = 'hFFFFFFFF;
  #10  I = 'h1; A = 'h0AABB002; B = 'h0BB00002;
  #10  I = 'h1; A = 'hFF0055AA; B = 'hCCAA8932;
  #10  I = 'h1; A = 'h00CD0956; B = 'h0000000AA;
  #10  I = 'h1; A = 'h00CD0956; B = 'h0011AAFF;
  #10  I = 'h1; A = 'hAB000022; B = 'h00CC0022;
  #10  I = 'h1; A = 'h0CFA67AB; B = 'h00CB0022;
  #10  I = 'h1; A = 'h00FAFAFA; B = 'h0000FF22;
  #10  I = 'h1; A = 'hFFFFFFFF; B = 'hAAAAAAAA;
  
  //test and
  
  #10  I = 'h8; A = 'h00000000; B = 'h00000000; 
  #10  I = 'h8; A = 'h000000AA; B = 'h000000AA;
  #10  I = 'h8; A = 'h000000AA; B = 'h000000AB;
  #10  I = 'h8; A = 'hAB0000AA; B = 'h00CC00AA;
  #10  I = 'h8; A = 'h00CD00AA; B = 'h23000023;
  #10  I = 'h8; A = 'h1200BD67; B = 'h0DEF8944;
  #10  I = 'h8; A = 'hDD8750BA; B = 'h98BDEF32;
  #10  I = 'h8; A = 'hAAAAAAAA; B = 'hAAAAAAAA;
  #10  I = 'h8; A = 'hAAAAAAAA; B = 'hDDDDDDDD;
  
  //test or
  
  #10  I = 'h9; A = 'h00000000; B = 'h00000000; 
  #10  I = 'h9; A = 'h000000AA; B = 'h000000AA;
  #10  I = 'h9; A = 'h000000AA; B = 'h000000AB;
  #10  I = 'h9; A = 'hAB0000AA; B = 'h00CC00AA;
  #10  I = 'h9; A = 'h00CD00AA; B = 'h23000023;
  #10  I = 'h9; A = 'h1200BD67; B = 'h0DEF8944;
  #10  I = 'h9; A = 'hDD8750BA; B = 'h98BDEF32;
  #10  I = 'h9; A = 'hAAAAAAAA; B = 'hAAAAAAAA;
  #10  I = 'h9; A = 'hAAAAAAAA; B = 'hDDDDDDDD;
  
  //test xor
  
  #10  I = 'hA; A = 'h00000000; B = 'h00000000; 
  #10  I = 'hA; A = 'h000000AA; B = 'h000000AA;
  #10  I = 'hA; A = 'h000000AA; B = 'h000000AB;
  #10  I = 'hA; A = 'hAB0000AA; B = 'h00CC00AA;
  #10  I = 'hA; A = 'h00CD00AA; B = 'h23000023;
  #10  I = 'hA; A = 'h1200BD67; B = 'h0DEF8944;
  #10  I = 'hA; A = 'hDD8750BA; B = 'h98BDEF32;
  #10  I = 'hA; A = 'hAAAAAAAA; B = 'hAAAAAAAA;
  #10  I = 'hA; A = 'hAAAAAAAA; B = 'hDDDDDDDD;
  
  //test xnor
  
  #10  I = 'hB; A = 'h00000000; B = 'h00000000; 
  #10  I = 'hB; A = 'h000000AA; B = 'h000000AA;
  #10  I = 'hB; A = 'h000000AA; B = 'h000000AB;
  #10  I = 'hB; A = 'hAB0000AA; B = 'h00CC00AA;
  #10  I = 'hB; A = 'h00CD00AA; B = 'h23000023;
  #10  I = 'hB; A = 'h1200BD67; B = 'h0DEF8944;
  #10  I = 'hB; A = 'hDD8750BA; B = 'h98BDEF32;
  #10  I = 'hB; A = 'hAAAAAAAA; B = 'hAAAAAAAA;
  #10  I = 'hB; A = 'hAAAAAAAA; B = 'hDDDDDDDD;
  
  
	
  
  
     
    #10 $stop;
  end
  
initial
   begin
    $display("      time I A  B  Result "); 
    $monitor($stime,, I,,, A,,, B,,,  Result,,,,,, ); 
   end

endmodule  
