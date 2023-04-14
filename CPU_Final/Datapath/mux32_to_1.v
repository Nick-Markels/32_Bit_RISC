// -----------------------------------------------------------
//	Module:		32-1 MUX
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		March 1, 2022
// ----------------------------------------------------------

module mux32_to_1(z, y31, y30, y29, y28, y27, y26, y25, y24, y23, 
			y22, y21, y20, y19, y18, y17, y16, y15, y14, 
			y13, y12, y11, y10, y9, y8, y7, y6, y5, y4,
			y3, y2, y1, y0, s4, s3, s2, s1, s0);

output [31:0] z;

input  [31:0] y31;
input  [31:0] y30;
input  [31:0] y29;
input  [31:0] y28;
input  [31:0] y27;
input  [31:0] y26;
input  [31:0] y25;
input  [31:0] y24;
input  [31:0] y23;
input  [31:0] y22;
input  [31:0] y21;
input  [31:0] y20;
input  [31:0] y19;
input  [31:0] y18;
input  [31:0] y17;
input  [31:0] y16;
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
input 	      s4;
input         s3;
input         s2;
input         s1;
input         s0;

wire [31:0] w1;
wire [31:0] w0;

mux16_to_1 mux1(w1, y31, y30, y29, y28, y27, y26, y25, 
		y24, y23, y22, y21, y20, y19, y18, y17, y16, s3, s2, s1, s0);

mux16_to_1 mux2(w0, y15, y14, y13, y12, y11, y10, y9, y8, 
		y7, y6, y5, y4, y3, y2, y1, y0, s3, s2, s1, s0);

mux2_to_1 mux3(z, w1, w0, s4);

endmodule