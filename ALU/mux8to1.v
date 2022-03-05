module mux8to1(Out, S2, S1, S0, A, B, C, D, E, F, G, H);

output reg Out;
input S2, S1, S0, A, B, C, D, E, F, G, H;

wire w0, w1;

mux4to1 mux4to11(w0, S1, S0, A, B, C, D);
mux4to1 mux4to12(w1, S1, S0, E, F, G, H);
mux2to1 mux2to11 (Out, S2, w0, w1);

endmodule
