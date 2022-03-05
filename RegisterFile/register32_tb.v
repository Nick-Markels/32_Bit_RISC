`timescale 1ns / 1ns

module register32_tb;

parameter WIDTH = 32;

reg 	clk, reset, enable;
reg		[WIDTH-1:0]	D;
wire	[WIDTH-1:0]	Q;

register32 register(D, Q, clk, reset, enable);

initial
    begin
        clk = 0;
        forever #10 clk = !clk;
    end

initial
    begin
    
	#3  enable = 1;
        #5  reset = 0;
         D = 'h6FFFFFFF;
        #54 D = 'h0088140A;
        #10 reset = 1;	
	#10 D = 'h2288140A;
	#10 D = 'hAAAAAA88;
	#10 enable = 0;
	#10 D = 'hC0C0C0C0;
	#10 D = 'h12345678;
	#10 enable = 1;
	#10 D = 'h11111111;
	#10 D = 'h33333333;
		
	end
	
	   initial
        $monitor($stime,, D,,, Q,,, clk,,, reset,,, enable);
           
    
endmodule
		