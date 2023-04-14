module shiftleft32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0]	Result;
input		[WIDTH-1:0]	A, B;

assign Result = A << B;

endmodule