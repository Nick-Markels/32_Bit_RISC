// -----------------------------------------------------------
//	Module:		4:16 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module decoder4_to_16(y15, y14, y13, y12, y11, y10, y9, y8, y7, y6, y5, y4, y3, y2, y1, y0, a, b, c, d);

output reg y15, y14, y13, y12, y11, y10, y9, y8;
output reg y7, y6, y5, y4, y3, y2, y1, y0;
input a, b, c, d;

wire w4, w3, w2, w1;

decoder2_to_4 decoder1(w4, w3, w2, w1, a, b, 1'b1);
decoder2_to_4 decoder2(y15, y14, y13, y12, c, d, w4);
decoder2_to_4 decoder3(y11, y10, y9, y8, c, d, w3);
decoder2_to_4 decoder4(y7, y6, y5, y4, c, d, w2);
decoder2_to_4 decoder5(y3, y2, y1, y0, c, d, w1);

endmodule