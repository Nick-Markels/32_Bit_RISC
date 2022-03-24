//-------------------------------------------------------
//	Module: Testbench for 32-bit RAM 
//	Author: Jude Gabriel
//------------------------------------------------------

`include "MyMacros.svh"
`timescale 1ns/1ns


module ram_tb;

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




//Additional test variables
reg [DWIDTH-1:0] testArray[DWIDTH-1:0];
integer i, idx, idx_next;
reg [DWIDTH-1:0] wr_data;
reg rst;
reg even_cycle, even_cycle_nxt;



RAM ram1(data, rdEn, wrEn, addr, clk);

assign data = (wrEn) ? wr_data : {DWIDTH{1'bz}};

initial 
begin 
  clk = 0;
  wrEn = 1;
  rdEn = 0;
  addr = 1;
  forever #10 clk = !clk;
end


initial
begin 
  rst = 0;
  for(i = 0; i < DWIDTH; i++)
  begin
    testArray[i] = $random;
  end
  wait (clk);
  even_cycle_nxt = 0;
  idx_next = 0;
  wait (~clk);
  rst = 1;
end

always @(posedge even_cycle)
begin 
  addr = addr + 2'b10;
end

always @(posedge even_cycle_nxt)
begin 
  addr = addr - 1'b1;
end


always @(*)
begin
  even_cycle_nxt = even_cycle + 1;
  if(even_cycle)
  begin
    wrEn = 1;
    rdEn = 0;
  end
  else
  begin
    wrEn = 0;
    rdEn = 1;
  end
  if(idx < DWIDTH)
  begin
    if(even_cycle)
      wr_data = testArray[idx];
    else
    begin
      testArray[idx] = data;
      idx_next = idx + 1;
    end
  end
end

`DFFR(idx, idx_next, clk, rst, '0);
`DFFR(even_cycle, even_cycle_nxt, clk, rst, 1'b1);
endmodule
