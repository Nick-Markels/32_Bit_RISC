// -----------------------------------------------------------
//	Module:		32-Bit Buffer with Negated Control
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------


module bufif_not32(out, in, control);

output [31:0] out;
input  [31:0] in;
input 	      control;


bufif0 b1(out[0], in[0], control);
bufif0 b2(out[1], in[1], control);
bufif0 b3(out[2], in[2], control);
bufif0 b4(out[3], in[3], control);
bufif0 b5(out[4], in[4], control);
bufif0 b6(out[5], in[5], control);
bufif0 b7(out[6], in[6], control);
bufif0 b8(out[7], in[7], control);
bufif0 b9(out[8], in[8], control);
bufif0 b10(out[9], in[9], control);
bufif0 b11(out[10], in[10], control);
bufif0 b12(out[11], in[11], control);
bufif0 b13(out[12], in[12], control);
bufif0 b14(out[13], in[13], control);
bufif0 b15(out[14], in[14], control);
bufif0 b16(out[15], in[15], control);
bufif0 b17(out[16], in[16], control);
bufif0 b18(out[17], in[17], control);
bufif0 b19(out[18], in[18], control);
bufif0 b20(out[19], in[19], control);
bufif0 b21(out[20], in[20], control);
bufif0 b22(out[21], in[21], control);
bufif0 b23(out[22], in[22], control);
bufif0 b24(out[23], in[23], control);
bufif0 b25(out[24], in[24], control);
bufif0 b26(out[25], in[25], control);
bufif0 b27(out[26], in[26], control);
bufif0 b28(out[27], in[27], control);
bufif0 b29(out[28], in[28], control);
bufif0 b30(out[29], in[29], control);
bufif0 b31(out[30], in[30], control);
bufif0 b32(out[31], in[31], control);

endmodule