// -----------------------------------------------------------
//	Module:		32-Bit ALU
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module alu32(c, a, b, s3, s2, s1, s0);

output     [31:0] c;
input      [31:0] a;
input      [31:0] b;
input		  s3;
input		  s2;
input		  s1;
input		  s0;

//Enable signals from decoder
wire add_en, sub_en, mult_en, and_en, or_en, xor_en, xnor_en, sr_en, sl_en, srs_en;

//Output signals from logic components
wire [31:0] add_out;
wire [31:0] sub_out;
wire [31:0] mult_out;
wire [31:0] and_out;
wire [31:0] or_out;
wire [31:0] xor_out;
wire [31:0] xnor_out;
wire [31:0] sr_out;
wire [31:0] sl_out;
wire [31:0] srs_out;

//Instantiate ALU components
decoder4_to_16             decoder1(, srs_en, sr_en, sl_en, xnor_en, xor_en, or_en, and_en, , , , , , mult_en, sub_en, add_en, s3, s2, s1, s0);
cla_adder32           	     adder1( , add_out, a, b);
bla_subtractor32 	subtractor1( , sub_out, a, b);
multiplier              multiplier1(mult_out, a, b);
and32                          and1(and_out, a, b);
or32                            or1(or_out, a, b);
xor32                          xor1(xor_out, a, b);
xnor32                        xnor1(xnor_out, a, b);
shiftleft32		        sl1(sl_out, a, b);
shiftright32		        sr1(sr_out, a, b);
shift_right_sign_extension     srs1(srs_out, a, b);

//Pass each output through buffer with corresponding enable
bufif32  add_to_c(c, add_out, add_en);
bufif32  sub_to_c(c, sub_out, sub_en);
bufif32 mult_to_c(c, mult_out, mult_en);
bufif32  and_to_c(c, and_out, and_en);
bufif32   or_to_c(c, or_out, or_en);
bufif32  xor_to_c(c, xor_out, xor_en);
bufif32 xnor_to_c(c, xnor_out, xnor_en);
bufif32   sl_to_c(c, sl_out, sl_en);
bufif32   sr_to_c(c, sr_out, sr_en);
bufif32  srs_to_c(c, srs_out, srs_en);


endmodule