// -----------------------------------------------------------
//	Module:		1-Bit Borrow-Look-Ahead Subtractor
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module borrow_look_ahead_subtractor(bout, diff, a, b, bin);

output		bout;
output reg	diff;
input 		a;
input		b;
input		bin;

wire g, p, w1, w2;

not   n1(w1, a);
and   a1(g, w1, b);
xnor xn1(p, a, b);
and   a2(w2, bin, p);
xnor xn2(diff, bin, p);
or   or1(bout, w2, g);

endmodule
