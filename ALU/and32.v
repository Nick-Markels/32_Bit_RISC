module and32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0] Result;

input		[WIDTH-1:0] A,B;

	and a31(Result[31], A[31], B[31]);
	and a30(Result[30], A[30], B[30]);
	and a29(Result[29], A[29], B[29]);
	and a28(Result[28], A[28], B[28]);
	and a27(Result[27], A[27], B[27]);
	and a26(Result[26], A[26], B[26]);
	and a25(Result[25], A[25], B[25]);
	and a24(Result[24], A[24], B[24]);
	and a23(Result[23], A[23], B[23]);
	and a22(Result[22], A[22], B[22]);
	and a21(Result[21], A[21], B[21]);
	and a20(Result[20], A[20], B[20]);
	and a19(Result[19], A[19], B[19]);
	and a18(Result[18], A[18], B[18]);
	and a17(Result[17], A[17], B[17]);
	and a16(Result[16], A[16], B[16]);
	and a15(Result[15], A[15], B[15]);
	and a14(Result[14], A[14], B[14]);
	and a13(Result[13], A[13], B[13]);
	and a12(Result[12], A[12], B[12]);
	and a11(Result[11], A[11], B[11]);
	and a10(Result[10], A[10], B[10]);
	and a9(Result[9], A[9], B[9]);
	and a8(Result[8], A[8], B[8]);
	and a7(Result[7], A[7], B[7]);
	and a6(Result[6], A[6], B[6]);
	and a5(Result[5], A[5], B[5]);
	and a4(Result[4], A[4], B[4]);
	and a3(Result[3], A[3], B[3]);
	and a2(Result[2], A[2], B[2]);
	and a1(Result[1], A[1], B[1]);
	and a0(Result[0], A[0], B[0]);

endmodule