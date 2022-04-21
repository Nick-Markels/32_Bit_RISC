// -----------------------------------------------------------
//	Module:		32-Bit XNOR
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module xnor32(Result, A, B);

parameter WIDTH = 32;

output		[WIDTH-1:0] Result;

input		[WIDTH-1:0] A,B;

genvar j;

generate for (j=0; j<32; j=j+1) begin: xnor_loop
	   xnor xn1(Result[j], A[j], B[j]);
	end
endgenerate

endmodule
