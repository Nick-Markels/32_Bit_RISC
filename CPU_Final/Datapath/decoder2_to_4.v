// -----------------------------------------------------------
//	Module:		2:4 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module decoder2_to_4(y3, y2, y1, y0, a, b, en);

output y3;
output y2;
output y1;
output y0;
input a;
input b;
input en;

wire w1, w2;

decoder1_to_2 decoder1(w2, w1, a, en);
decoder1_to_2 decoder2(y1, y0, b, w1);
decoder1_to_2 decoder3(y3, y2, b, w2);

endmodule

