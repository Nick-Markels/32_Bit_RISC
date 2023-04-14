//-------------------------------------------------------
//	Module: Testbench for 32-bit RAM 
//	Author: Jude Gabriel
//------------------------------------------------------

`include "MyMacros.svh"
`timescale 1ns/1ns


module ram_tb2;

//Parameters
parameter DWIDTH = 32;
parameter MEMDEPTH = 256;
parameter AWIDTH = $clog2(MEMDEPTH);

//IO 
tri   [DWIDTH-1:0] data;
reg 	           rdEn;
reg		   wrEn;
reg   [AWIDTH-1:0] addr;
reg		   clk;
reg [DWIDTH-1:0] wr_data;

RAM ram1(data, rdEn, wrEn, addr, clk);

assign data = (wrEn) ? wr_data : {DWIDTH{1'bz}};

initial 
begin 
  clk = 0;
  forever #10 clk = !clk;
end

initial 
begin 
  #10 wrEn = 1; rdEn = 0; wr_data = 32'hFFFFFFFF; addr = 32'h00000000;
  #20 wrEn = 0; 
  #20 wrEn = 1; rdEn = 0; wr_data = 32'h11111111; addr = 32'h00000001;
  #20 wrEn = 0; 
  #20 wrEn = 0; rdEn = 1; addr = 32'h00000000;
  #20 rdEn = 0; 
  #20 wrEn = 0; rdEn = 1; addr = 32'h00000001;
end 
endmodule 