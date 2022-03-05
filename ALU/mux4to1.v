module mux4to1(F, S1, S0, A, B, C, D);

output reg F;

input S1, S0, A, B, C, D;

wire w1, w2;

mux2to1 mux2to11 (w1, S0, A, B);
mux2to1 mux2to12 (w2, S0, C, D);
mux2to1 mux2to13 (F, S1, w1, w2);

endmodule
