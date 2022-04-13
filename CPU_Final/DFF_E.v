module D_FF(q, d, clk, reset, enable);

output q;
input d, clk, reset, enable;

wire dFromMux;

mux2to1 mux(q, d, enable, dFromMux);

D_FF_nE dff(q, dFromMux, clk, reset);

endmodule