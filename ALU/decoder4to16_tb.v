`timescale 1ns /1ns

module decoder4to16_tb;

reg En;
reg [3:0] I;

wire Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

decoder4to16 decoder4to160(Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I, En);

initial 
 begin
		#10  En = 0; I = 'h3;
		#10  En = 1; I = 'h0;
		#10  En = 1; I = 'h1;
		#10  En = 1; I = 'h9;
		#10  En = 1; I = 'h9;
		#10  En = 1; I = 'hA;
		#10  En = 1; I = 'hB;
        
		
	#10 $stop;
  end
  
    initial
   begin
    $display("      time En I Y15 Y14 Y13 Y12 Y11 Y10 Y9 Y8 Y7 Y6 Y5 Y4 Y3 Y2 Y1 Y0 ");
    $monitor($stime,, En,,, I,,, Y15,,, Y14,,, Y13,,, Y12,,, Y11,,, Y10,,, Y9,,, Y8,,, Y7,,, Y6,,, Y5,,, Y4,,, Y3,,, Y2,,, Y1,,, Y0);
   end

endmodule  