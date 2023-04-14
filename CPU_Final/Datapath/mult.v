// -----------------------------------------------------------
//	Module:		32-Bit Multiplier
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		April 12, 2022
// ----------------------------------------------------------

module multiplier(z, a, b);

input [31:0] a;
input [31:0] b;
output [31:0] z;

assign z = a * b;

endmodule