module ALU(Result, I, A, B);

parameter WIDTH = 32;

output	[WIDTH-1:0] Result;

input	[WIDTH-1:0] A, B;

input  [3:0] I;

wire En;

assign En = 1'b1;

wire Y0, Y1, Y8, Y9, Y10, Y11;
wire [WIDTH-1:0] w0, w1, w2, w3, w4, w5;

decoder4to16 decoder4to161(Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I[3:0], En);

adder32 adder320(Carry, w0[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);
subtractor32 subtractor320(Bout, w1[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);
and32 and320(w2[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);
or32 or320(w3[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);
xor32 xor320(w4[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);
xnor32 xnor320(w5[WIDTH-1:0], A[WIDTH-1:0], B[WIDTH-1:0]);

bufif32 bufif320(Result[WIDTH-1:0], w0[WIDTH-1:0], Y0);
bufif32 bufif321(Result[WIDTH-1:0], w1[WIDTH-1:0], Y1);
bufif32 bufif322(Result[WIDTH-1:0], w2[WIDTH-1:0], Y8);
bufif32 bufif323(Result[WIDTH-1:0], w3[WIDTH-1:0], Y9);
bufif32 bufif324(Result[WIDTH-1:0], w4[WIDTH-1:0], Y10);
bufif32 bufif325(Result[WIDTH-1:0], w5[WIDTH-1:0], Y11);


endmodule


