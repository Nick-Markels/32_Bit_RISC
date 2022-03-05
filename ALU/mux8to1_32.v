module mux8to1_32(Out, S2, S1, S0, A, B, C, D, E, F, G, H);

parameter WIDTH = 32;

output [WIDTH-1:0] Out;
input [WIDTH-1:0] A, B, C, D, E, F, G, H;
input S2, S1, S0;

mux8to1 mux8to131(Out[31], S2, S1, S0, A[31], B[31], C[31], D[31], E[31], F[31], G[31], H[31]);
mux8to1 mux8to130(Out[30], S2, S1, S0, A[30], B[30], C[30], D[30], E[30], F[30], G[30], H[30]);
mux8to1 mux8to129(Out[29], S2, S1, S0, A[29], B[29], C[29], D[29], E[29], F[29], G[29], H[29]);
mux8to1 mux8to128(Out[28], S2, S1, S0, A[28], B[28], C[28], D[28], E[28], F[28], G[28], H[28]);
mux8to1 mux8to127(Out[27], S2, S1, S0, A[27], B[27], C[27], D[27], E[27], F[27], G[27], H[27]);
mux8to1 mux8to126(Out[26], S2, S1, S0, A[26], B[26], C[26], D[26], E[26], F[26], G[26], H[26]);
mux8to1 mux8to125(Out[25], S2, S1, S0, A[25], B[25], C[25], D[25], E[25], F[25], G[25], H[25]);
mux8to1 mux8to124(Out[24], S2, S1, S0, A[24], B[24], C[24], D[24], E[24], F[24], G[24], H[24]);
mux8to1 mux8to123(Out[23], S2, S1, S0, A[23], B[23], C[23], D[23], E[23], F[23], G[23], H[23]);
mux8to1 mux8to122(Out[22], S2, S1, S0, A[22], B[22], C[22], D[22], E[22], F[22], G[22], H[22]);
mux8to1 mux8to121(Out[21], S2, S1, S0, A[21], B[21], C[21], D[21], E[21], F[21], G[21], H[21]);
mux8to1 mux8to120(Out[20], S2, S1, S0, A[20], B[20], C[20], D[20], E[20], F[20], G[20], H[20]);
mux8to1 mux8to119(Out[19], S2, S1, S0, A[19], B[19], C[19], D[19], E[19], F[19], G[19], H[19]);
mux8to1 mux8to118(Out[18], S2, S1, S0, A[18], B[18], C[18], D[18], E[18], F[18], G[18], H[18]);
mux8to1 mux8to117(Out[17], S2, S1, S0, A[17], B[17], C[17], D[17], E[17], F[17], G[17], H[17]);
mux8to1 mux8to116(Out[16], S2, S1, S0, A[16], B[16], C[16], D[16], E[16], F[16], G[16], H[16]);
mux8to1 mux8to115(Out[15], S2, S1, S0, A[15], B[15], C[15], D[15], E[15], F[15], G[15], H[15]);
mux8to1 mux8to114(Out[14], S2, S1, S0, A[14], B[14], C[14], D[14], E[14], F[14], G[14], H[14]);
mux8to1 mux8to113(Out[13], S2, S1, S0, A[13], B[13], C[13], D[13], E[13], F[13], G[13], H[13]);
mux8to1 mux8to112(Out[12], S2, S1, S0, A[12], B[12], C[12], D[12], E[12], F[12], G[12], H[12]);
mux8to1 mux8to111(Out[11], S2, S1, S0, A[11], B[11], C[11], D[11], E[11], F[11], G[11], H[11]);
mux8to1 mux8to110(Out[10], S2, S1, S0, A[10], B[10], C[10], D[10], E[10], F[10], G[10], H[10]);
mux8to1 mux8to19(Out[9], S2, S1, S0, A[9], B[9], C[9], D[9], E[9], F[9], G[9], H[9]);
mux8to1 mux8to18(Out[8], S2, S1, S0, A[8], B[8], C[8], D[8], E[8], F[8], G[8], H[8]);
mux8to1 mux8to17(Out[7], S2, S1, S0, A[7], B[7], C[7], D[7], E[7], F[7], G[7], H[7]);
mux8to1 mux8to16(Out[6], S2, S1, S0, A[6], B[6], C[6], D[6], E[6], F[6], G[6], H[6]);
mux8to1 mux8to15(Out[5], S2, S1, S0, A[5], B[5], C[5], D[5], E[5], F[5], G[5], H[5]);
mux8to1 mux8to14(Out[4], S2, S1, S0, A[4], B[4], C[4], D[4], E[4], F[4], G[4], H[4]);
mux8to1 mux8to13(Out[3], S2, S1, S0, A[3], B[3], C[3], D[3], E[3], F[3], G[3], H[3]);
mux8to1 mux8to12(Out[2], S2, S1, S0, A[2], B[2], C[2], D[2], E[2], F[2], G[2], H[2]);
mux8to1 mux8to11(Out[1], S2, S1, S0, A[1], B[1], C[1], D[1], E[1], F[1], G[1], H[1]);
mux8to1 mux8to10(Out[0], S2, S1, S0, A[0], B[0], C[0], D[0], E[0], F[0], G[0], H[0]);

endmodule