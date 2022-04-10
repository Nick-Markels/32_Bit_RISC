// ------------------------------------------------------
//	Module:		1-Bit Carry-Look-Ahead Adder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 3, 2022
// -----------------------------------------------------

module carry_look_ahead_adder(cout, sum, a, b, cin);

output cout;
output reg sum;
input a, b, cin;

wire p, g, w1;

and and1(g, a, b);
xor xor1(p, a, b);
and and2(w1, p, cin);
or   or1(cout, g, w1);
xor xor2(sum, p, cin);

endmodule