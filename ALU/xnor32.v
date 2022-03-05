module xnor32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0] Result;

input		[WIDTH-1:0] A,B;

	xnor xn31(Result[31], A[31], B[31]);
	xnor xn30(Result[30], A[30], B[30]);
	xnor xn29(Result[29], A[29], B[29]);
	xnor xn28(Result[28], A[28], B[28]);
	xnor xn27(Result[27], A[27], B[27]);
	xnor xn26(Result[26], A[26], B[26]);
	xnor xn25(Result[25], A[25], B[25]);
	xnor xn24(Result[24], A[24], B[24]);
	xnor xn23(Result[23], A[23], B[23]);
	xnor xn22(Result[22], A[22], B[22]);
	xnor xn21(Result[21], A[21], B[21]);
	xnor xn20(Result[20], A[20], B[20]);
	xnor xn19(Result[19], A[19], B[19]);
	xnor xn18(Result[18], A[18], B[18]);
	xnor xn17(Result[17], A[17], B[17]);
	xnor xn16(Result[16], A[16], B[16]);
	xnor xn15(Result[15], A[15], B[15]);
	xnor xn14(Result[14], A[14], B[14]);
	xnor xn13(Result[13], A[13], B[13]);
	xnor xn12(Result[12], A[12], B[12]);
	xnor xn11(Result[11], A[11], B[11]);
	xnor xn10(Result[10], A[10], B[10]);
	xnor xn9(Result[9], A[9], B[9]);
	xnor xn8(Result[8], A[8], B[8]);
	xnor xn7(Result[7], A[7], B[7]);
	xnor xn6(Result[6], A[6], B[6]);
	xnor xn5(Result[5], A[5], B[5]);
	xnor xn4(Result[4], A[4], B[4]);
	xnor xn3(Result[3], A[3], B[3]);
	xnor xn2(Result[2], A[2], B[2]);
	xnor xn1(Result[1], A[1], B[1]);
	xnor xn0(Result[0], A[0], B[0]);

endmodule