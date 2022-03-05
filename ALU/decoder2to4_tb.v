`timescale 1ns /1ns

module decoder2to4_tb;

reg I1, I0, En;

wire Y3, Y2, Y1, Y0;

decoder2to4 decoder2to40(Y3, Y2, Y1, Y0, I1, I0, En);

initial 
 begin
		#10  En = 0; I1 =  1; I0 = 0; 
                #10  En = 1; I1 =  0; I0 = 0; 
		#10  En = 1; I1 =  0; I0 = 1;
		#10  En = 1; I1 =  1; I0 = 0; 
		#10  En = 1; I1 =  1; I0 = 1; 
		
		
	#10 $stop;
  end
  
    initial
   begin
    $display("      time En  I1 I0  Y3 Y2 Y1 Y0 ");
    $monitor($stime,, En,,, I1,,, I0,,, Y3,,, Y2,,, Y1,,, Y0);
   end

endmodule  