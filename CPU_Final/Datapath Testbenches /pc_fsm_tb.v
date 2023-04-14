//--------------------------------------
// Testbench for pc controller
//
// Authors: Jude Gabriel, Nick Markels 
//--------------------------------------

`timescale 1ns / 1ns

module pc_fsm_tb;

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

wire [WIDTH-1:0] irOut;

reg go_fetch; 
reg go_pc;


 



controller controller(marEn, pcFetch, pcEn, wEn, irEn, ldEn, stEn, mdrEn, wr, rd, clk, reset, irOut, go_fetch, go_pc);

initial 
  begin 
    clk = 0;
    forever #10 clk = !clk;
  end 


initial 
  begin
//----------------- TEST PC CONTROL SIGNALS --------------//
	#10 reset = 1'b0;
	#10 reset = 1'b1;
	#10 go_pc = 'b0;
	#60 go_pc = 'b1;
	#110 go_pc = 'b0;
	#100 $stop;
  end  


endmodule