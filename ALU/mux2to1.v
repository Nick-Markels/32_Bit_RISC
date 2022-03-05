module mux2to1(F, S, A, B);

output reg F;

input S, A, B;

wire w0, w1;
wire S_n;

not n1(S_n, S);
and a0(w0, S_n, A);
and a1(w1, S, B);
or o1(F, w1, w0);



endmodule

