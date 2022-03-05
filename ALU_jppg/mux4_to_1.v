// -----------------------------------------------------------
//	Module:		4-1 MUX
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 5, 2022
// ----------------------------------------------------------

module mux4_to_1(z, a, b, c, d, s1, s0);

output [31:0] z;
input  [31:0] a;
input  [31:0] b;
input  [31:0] c;
input  [31:0] d;
input         s1;
input         s0;

wire [31:0] y1;
wire [31:0] y0;

mux2_to_1 mux1(y1, a, b, s0);
mux2_to_1 mux2(y0, c, d, s0);
mux2_to_1 mux3(z, y1, y0, s1);

endmodule