`timescale 1ns / 1ns

module   D_FF  (q, d, clk, reset, enable);

output q;
input  d, clk, reset, enable;

reg    q;
wire 	D;

mux2to1 mux1(q, d, enable, D);


always @(negedge reset or posedge clk)

 // if (reset)
 if (~reset)
    q <= 1'b0;
 else
    q <= D; 

endmodule