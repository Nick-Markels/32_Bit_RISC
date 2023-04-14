// -----------------------------------------------------------
//	Module:		32-Bit Arithemtic Right Shift
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		March 14, 2022
// ----------------------------------------------------------

module shift_right_sign_extension(z, a, b);

input signed [31:0] a;
input  [31:0] b;
output [31:0] z;

assign z = a >>> b;

endmodule

