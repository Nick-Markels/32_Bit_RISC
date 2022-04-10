//-------------------------------------------------------
//	Module: 32-bit RAM 
//	Author: Jude Gabriel
//------------------------------------------------------

`timescale 1ns/1ns

module RAM(data, rdEn, wrEn, addr, clk);

//Parameters
parameter DWIDTH = 32;
parameter MEMDEPTH = 256;
parameter AWIDTH = $clog2(MEMDEPTH);

//IO 
inout [DWIDTH-1:0] data;
input 	           rdEn;
input		   wrEn;
input [DWIDTH-1:0] addr;
input		   clk;

tri [DWIDTH-1:0] data;
reg [DWIDTH-1:0] rd_data;

assign data = (rdEn) ? rd_data : {DWIDTH{1'bz}};

//Internal Storage
reg [DWIDTH-1:0] mem [MEMDEPTH-1:0];


always @(posedge clk)
begin
  if(rdEn)
	rd_data = mem[addr[7:2]];
  if(wrEn)
	mem[addr[7:2]] = data;
end 

endmodule