module subtractor32(Bout, Diff, A, B);

parameter WIDTH = 32;

output		reg [WIDTH-1:0] Diff;
output					Bout;
input		wire [WIDTH-1:0] A, B;

wire 		[WIDTH-1:0] Bin;

	assign Bin[0] = 1'b0;
	
fullsubtractor subtractor31 (Bout, Diff[31], A[31], B[31], Bin[31]);
fullsubtractor subtractor30 (Bin[31], Diff[30], A[30], B[30], Bin[30]);
fullsubtractor subtractor29 (Bin[30], Diff[29], A[29], B[29], Bin[29]);
fullsubtractor subtractor28 (Bin[29], Diff[28], A[28], B[28], Bin[28]);
fullsubtractor subtractor27 (Bin[28], Diff[27], A[27], B[27], Bin[27]);
fullsubtractor subtractor26 (Bin[27], Diff[26], A[26], B[26], Bin[26]);
fullsubtractor subtractor25 (Bin[26], Diff[25], A[25], B[25], Bin[25]);
fullsubtractor subtractor24 (Bin[25], Diff[24], A[24], B[24], Bin[24]);
fullsubtractor subtractor23 (Bin[24], Diff[23], A[23], B[23], Bin[23]);
fullsubtractor subtractor22 (Bin[23], Diff[22], A[22], B[22], Bin[22]);
fullsubtractor subtractor21 (Bin[22], Diff[21], A[21], B[21], Bin[21]);
fullsubtractor subtractor20 (Bin[21], Diff[20], A[20], B[20], Bin[20]);
fullsubtractor subtractor19 (Bin[20], Diff[19], A[19], B[19], Bin[19]);
fullsubtractor subtractor18 (Bin[19], Diff[18], A[18], B[18], Bin[18]);
fullsubtractor subtractor17 (Bin[18], Diff[17], A[17], B[17], Bin[17]);
fullsubtractor subtractor16 (Bin[17], Diff[16], A[16], B[16], Bin[16]);
fullsubtractor subtractor15 (Bin[16], Diff[15], A[15], B[15], Bin[15]);
fullsubtractor subtractor14 (Bin[15], Diff[14], A[14], B[14], Bin[14]);
fullsubtractor subtractor13 (Bin[14], Diff[13], A[13], B[13], Bin[13]);
fullsubtractor subtractor12 (Bin[13], Diff[12], A[12], B[12], Bin[12]);
fullsubtractor subtractor11 (Bin[12], Diff[11], A[11], B[11], Bin[11]);
fullsubtractor subtractor10 (Bin[11], Diff[10], A[10], B[10], Bin[10]);
fullsubtractor subtractor9 (Bin[10], Diff[9], A[9], B[9], Bin[9]);
fullsubtractor subtractor8 (Bin[9], Diff[8], A[8], B[8], Bin[8]);
fullsubtractor subtractor7 (Bin[8], Diff[7], A[7], B[7], Bin[7]);
fullsubtractor subtractor6 (Bin[7], Diff[6], A[6], B[6], Bin[6]);
fullsubtractor subtractor5 (Bin[6], Diff[5], A[5], B[5], Bin[5]);
fullsubtractor subtractor4 (Bin[5], Diff[4], A[4], B[4], Bin[4]);
fullsubtractor subtractor3 (Bin[4], Diff[3], A[3], B[3], Bin[3]);
fullsubtractor subtractor2 (Bin[3], Diff[2], A[2], B[2], Bin[2]);
fullsubtractor subtractor1 (Bin[2], Diff[1], A[1], B[1], Bin[1]);
fullsubtractor subtractor0 (Bin[1], Diff[0], A[0], B[0], Bin[0]);

endmodule