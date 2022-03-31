`timescale 1ns / 1ns

module PC_tb;

parameter WIDTH = 32;

reg 	clk, reset, enable;

wire	[WIDTH-1:0]	pcOutput;

 PC pc(pcOutput, clk, reset, enable);


initial
    begin
        clk = 0;
        forever #10 clk = !clk;
    end

initial
    begin
    
	#10  enable = 1;
        #10  reset = 0; //reset to 'h00000000
        #10 reset = 1;		
	#10 ;
        #10 enable = 0;
	#10 ;
	#10 ;	
	#10 ;
	#10 enable = 1;
	#10 ;
	#10 ;
	#10 ;
	#10  reset = 0;
	#10  reset = 1;
	#10 ;
	#10 ;
	#10 ;
		
	end
	
	   initial
        $monitor($stime,, pcOutput,,, clk,,, reset,,,enable,,,);
           
    
endmodule
		