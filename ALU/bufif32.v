module bufif32(Result, A, C);

parameter WIDTH = 32;

output 		[WIDTH-1:0] Result;
input 		[WIDTH-1:0] A;
input C;

	bufif1 b31(Result[31], A[31], C);
	bufif1 b30(Result[30], A[30], C);
	bufif1 b29(Result[29], A[29], C);
	bufif1 b28(Result[28], A[28], C);
	bufif1 b27(Result[27], A[27], C);
	bufif1 b26(Result[26], A[26], C);
	bufif1 b25(Result[25], A[25], C);
	bufif1 b24(Result[24], A[24], C);
	bufif1 b23(Result[23], A[23], C);
	bufif1 b22(Result[22], A[22], C);
	bufif1 b21(Result[21], A[21], C);
	bufif1 b20(Result[20], A[20], C);
	bufif1 b19(Result[19], A[19], C);
	bufif1 b18(Result[18], A[18], C);
	bufif1 b17(Result[17], A[17], C);
	bufif1 b16(Result[16], A[16], C);
	bufif1 b15(Result[15], A[15], C);
	bufif1 b14(Result[14], A[14], C);
	bufif1 b13(Result[13], A[13], C);
	bufif1 b12(Result[12], A[12], C);
	bufif1 b11(Result[11], A[11], C);
	bufif1 b10(Result[10], A[10], C);
	bufif1 b9(Result[9], A[9], C);
	bufif1 b8(Result[8], A[8], C);
	bufif1 b7(Result[7], A[7], C);
	bufif1 b6(Result[6], A[6], C);
	bufif1 b5(Result[5], A[5], C);
	bufif1 b4(Result[4], A[4], C);
	bufif1 b3(Result[3], A[3], C);
	bufif1 b2(Result[2], A[2], C);
	bufif1 b1(Result[1], A[1], C);
	bufif1 b0(Result[0], A[0], C);
	
endmodule 
