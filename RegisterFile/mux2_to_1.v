// -----------------------------------------------------------
//	Module:		2-1 MUX
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 5, 2022
// ----------------------------------------------------------

module mux2_to_1(c, a, b, s);

output [31:0] c;
input  [31:0] a;
input  [31:0] b;
input         s;

bufif32         buffer(c, a, s);
bufif_not32 buffer_not(c, b, s);

endmodule

