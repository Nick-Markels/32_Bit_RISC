`timescale 1ns /1ns

module decoder3to8_tb;

reg En;

reg I2, I1, I0;

wire Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

decoder3to8 deocoder3to80(Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I2, I1, I0, En);


initial 
 begin
	    #10  En = 0; I2 = 0; I1 = 0; I0 = 0;
		#10  En = 1; I2 = 0; I1 = 0; I0 = 0;
		#10  En = 1; I2 = 0; I1 = 0; I0 = 1;
		#10  En = 1; I2 = 0; I1 = 1; I0 = 0;
		#10  En = 1; I2 = 0; I1 = 1; I0 = 1;
		#10  En = 1; I2 = 1; I1 = 0; I0 = 0;
		#10  En = 1; I2 = 1; I1 = 0; I0 = 1;
		#10  En = 1; I2 = 1; I1 = 1; I0 = 0;
		#10  En = 1; I2 = 1; I1 = 1; I0 = 1;

        
		
	#10 $stop;
  end
  
  
      initial
   begin
    $display("      time En I2 I1 I0 Y7 Y6 Y5 Y4 Y3 Y2 Y1 Y0 ");
    $monitor($stime,, En,,, I2,,, I1,,, I0,,, Y7,,, Y6,,, Y5,,, Y4,,, Y3,,, Y2,,, Y1,,, Y0);
   end

endmodule  