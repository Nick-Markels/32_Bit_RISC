// -----------------------------------------------------------
//	Module:		16-1 MUX
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		March 1, 2022
// ----------------------------------------------------------

module mux16_to_1(z, y15, y14, y13, y12, y11, y10, y9, y8, y7, y6, y5, y4,
			y3, y2, y1, y0, s3, s2, s1, s0);

output [31:0] z;
input  [31:0] y15;
input  [31:0] y14;
input  [31:0] y13;
input  [31:0] y12;
input  [31:0] y11;
input  [31:0] y10;
input  [31:0] y9;
input  [31:0] y8;
input  [31:0] y7;
input  [31:0] y6;
input  [31:0] y5;
input  [31:0] y4;
input  [31:0] y3;
input  [31:0] y2;
input  [31:0] y1;
input  [31:0] y0;
input         s3;
input         s2;
input         s1;
input         s0;

wire [31:0] w1;
wire [31:0] w0;

mux8_to_1 mux1(w1, y15, y14, y13, y12, y11, y10, y9, y8, s2, s1, s0);
mux8_to_1 mux2(w0, y7, y6, y5, y4, y3, y2, y1, y0, s2, s1, s0);
mux2_to_1 mux3(z, w1, w0, s3);

endmodule