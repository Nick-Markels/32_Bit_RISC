module fullsubtractor(Bout, Diff, A, B, Bin);

output reg Diff, Bout;
input A, B, Bin;

wire w1, w2, G, P;

not n1(w1, A);
and a1(G, w1, B);
xnor xn1(P, A, B);
xnor xn2(Diff, P, Bin);
and a2(w2, P, Bin);
or o1(Bout, w2, G);

endmodule