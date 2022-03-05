module or32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0] Result;

input		[WIDTH-1:0] A,B;

	or o31(Result[31], A[31], B[31]);
	or o30(Result[30], A[30], B[30]);
	or o29(Result[29], A[29], B[29]);
	or o28(Result[28], A[28], B[28]);
	or o27(Result[27], A[27], B[27]);
	or o26(Result[26], A[26], B[26]);
	or o25(Result[25], A[25], B[25]);
	or o24(Result[24], A[24], B[24]);
	or o23(Result[23], A[23], B[23]);
	or o22(Result[22], A[22], B[22]);
	or o21(Result[21], A[21], B[21]);
	or o20(Result[20], A[20], B[20]);
	or o19(Result[19], A[19], B[19]);
	or o18(Result[18], A[18], B[18]);
	or o17(Result[17], A[17], B[17]);
	or o16(Result[16], A[16], B[16]);
	or o15(Result[15], A[15], B[15]);
	or o14(Result[14], A[14], B[14]);
	or o13(Result[13], A[13], B[13]);
	or o12(Result[12], A[12], B[12]);
	or o11(Result[11], A[11], B[11]);
	or o10(Result[10], A[10], B[10]);
	or o9(Result[9], A[9], B[9]);
	or o8(Result[8], A[8], B[8]);
	or o7(Result[7], A[7], B[7]);
	or o6(Result[6], A[6], B[6]);
	or o5(Result[5], A[5], B[5]);
	or o4(Result[4], A[4], B[4]);
	or o3(Result[3], A[3], B[3]);
	or o2(Result[2], A[2], B[2]);
	or o1(Result[1], A[1], B[1]);
	or o0(Result[0], A[0], B[0]);

endmodule