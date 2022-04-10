//--------------------------------------
// Testbench for fetch controller
//
// Authors: Jude Gabriel, Nick Markels 
//--------------------------------------

`timescale 1ns / 1ns

module fetch_tb;

parameter WIDTH = 32;

wire marEn;
wire pcFetch;
wire pcEn;
wire wEn;
wire irEn;
wire ldEn;
wire stEn;
wire mdrEn;
wire wr;
wire rd;
reg clk;
reg reset;

wire irOut;

reg go_fetch; 


 



controller controller(marEn, pcFetch, pcEn, wEn, irEn, ldEn, stEn, mdrEn, wr, rd, clk, reset, irOut, irInput, registerFileSelect, dataInput, go_fetch);

initial 
  begin 
    clk = 0;
    forever #10 clk = !clk;
  end 


initial 
  begin
//----------------- TEST FETCH CONTROL SIGNALS --------------//
	#10 reset = 1'b0;
	#10 reset = 1'b1;
	#10 go_fetch = 'b0;
	#100 go_fetch = 'b1;
	#110 go_fetch = 'b0;
	#100 $stop;
  end  


endmodule