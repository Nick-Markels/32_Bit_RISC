`timescale 1ns /1ns

module decoder1to2_tb;

reg I0, En;

wire Y1, Y0;

decoder1to2 decoder1to20(Y1, Y0, I0, En);

initial 
 begin
        #10  En = 0; I0 =  0; 
        #10  En = 0; I0 =  1;
		#10  En = 1; I0 =  0;     		
		#10  En = 1; I0 =  1; 
	    
	    
    #10 $stop;
  end
  
  initial
   begin
    $display("      time En  I0  Y1 Y0 ");
    $monitor($stime,, En,,, I0,,, Y1,,, Y0);
   end

endmodule  