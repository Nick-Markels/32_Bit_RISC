`timescale 1ns / 1ns

module bufif32_tb;

parameter WIDTH = 32;

wire 		[WIDTH-1:0] Result;
reg		[WIDTH-1:0] A;
reg C;

bufif32 bufif320(Result, A, C);

initial	// Test stimulus
  begin

    #10  A = 'h00CD00AA; C = 0; 
    #10  A = 'h00CD44AA; C = 0;
    #10  A = 'hFF00AABB; C = 1;
    #10  A = 'hFAB44567; C = 1;
     
    #10 $stop;
  end
  
initial
   begin
    $display("      time A  C  Result "); 
    $monitor($stime,, A,,, C,,,  Result,,,,,, ); 
   end

endmodule  
