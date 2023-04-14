// -----------------------------------------------------------
//	Module:		1:2 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module decoder1_to_2(y1, y0, x, en);

output y1;
output y0;
input  x;
input  en;

wire not_x;

not n1(not_x, x);
and a1(y0, not_x, en);
and a2(y1, x, en);

endmodule

