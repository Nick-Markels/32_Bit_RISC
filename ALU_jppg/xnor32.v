// -----------------------------------------------------------
//	Module:		32-Bit XNOR
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module xnor32(out, a, b);

output reg [31:0]	out;
input 	   [31:0]	a;
input      [31:0]	b;


xnor xnor1 [31:0] (out, a, b);

endmodule