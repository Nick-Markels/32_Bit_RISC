`timescale 1ns / 1ns

module   D_FF_nE  (q, d, clk, reset);

output reg q;
input  d, clk, reset;


always @(negedge reset or posedge clk)

 // if (reset)
 if (~reset)
    q <= 1'b0;
 else
    q <= d; 

endmodule