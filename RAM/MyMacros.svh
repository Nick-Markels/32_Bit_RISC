`ifndef MYMACROS_SVH
`define MYMACROS_SVH

`define DFFR(q, d, clk, rst_n, rst_val) \
	always_ff @(posedge clk, negedge rst_val) begin \
	  if(!rst_n) q <= rst_val; \
	  else	     q <= (d); \
	end 

`endif