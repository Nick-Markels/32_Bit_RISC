module xor32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0] Result;

input		[WIDTH-1:0] A,B;

	xor x31(Result[31], A[31], B[31]);
	xor x30(Result[30], A[30], B[30]);
	xor x29(Result[29], A[29], B[29]);
	xor x28(Result[28], A[28], B[28]);
	xor x27(Result[27], A[27], B[27]);
	xor x26(Result[26], A[26], B[26]);
	xor x25(Result[25], A[25], B[25]);
	xor x24(Result[24], A[24], B[24]);
	xor x23(Result[23], A[23], B[23]);
	xor x22(Result[22], A[22], B[22]);
	xor x21(Result[21], A[21], B[21]);
	xor x20(Result[20], A[20], B[20]);
	xor x19(Result[19], A[19], B[19]);
	xor x18(Result[18], A[18], B[18]);
	xor x17(Result[17], A[17], B[17]);
	xor x16(Result[16], A[16], B[16]);
	xor x15(Result[15], A[15], B[15]);
	xor x14(Result[14], A[14], B[14]);
	xor x13(Result[13], A[13], B[13]);
	xor x12(Result[12], A[12], B[12]);
	xor x11(Result[11], A[11], B[11]);
	xor x10(Result[10], A[10], B[10]);
	xor x9(Result[9], A[9], B[9]);
	xor x8(Result[8], A[8], B[8]);
	xor x7(Result[7], A[7], B[7]);
	xor x6(Result[6], A[6], B[6]);
	xor x5(Result[5], A[5], B[5]);
	xor x4(Result[4], A[4], B[4]);
	xor x3(Result[3], A[3], B[3]);
	xor x2(Result[2], A[2], B[2]);
	xor x1(Result[1], A[1], B[1]);
	xor x0(Result[0], A[0], B[0]);

endmodule