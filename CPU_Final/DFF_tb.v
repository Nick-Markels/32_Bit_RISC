`timescale 1ns / 1ns
module DFF_tb;

reg       clk, reset, enable;
reg       d;
wire      q;

D_FF dut (q, d, clk, reset, enable);

initial // Clock generator
  begin
    clk = 0;
    forever #10 clk = !clk;
  end
  
initial	// Test stimulus
  begin
    #4 reset = 1;
    #5 reset = 0;
    #4 reset = 1;
    #6 enable = 0;
    #12  d = 0;
    #14  d = 1;
    #15  d = 0;
    #16 d = 1;
    #18 enable = 1;
    #20  d = 0;
    #22  d = 1;
    #10  d = 1;
    #10  d = 1;
    #10  d = 0;
    #10  d = 0;
 #18 enable = 0;
    #20  d = 0;
    #22  d = 1;
    #10  d = 1;
    #10  d = 1;
    #10  d = 0;
    #10  d = 0;
    #10 enable = 1;
    #10 d = 1;
    #10 d = 1;				
    #10 enable = 0;
    #20  d = 0;
    #22  d = 1;
    #10  d = 1;
    #10  d = 1;
    #10  d = 0;
    #10  d = 0;

   end
  
initial
    $monitor($stime,, reset,, enable,, clk,,, d,,, q); 
    
endmodule  

