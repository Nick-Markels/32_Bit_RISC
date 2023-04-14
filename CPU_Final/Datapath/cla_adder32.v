// ------------------------------------------------------
//	Module:		32-Bit Carry-Look-Ahead Adder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 3, 2022
// -----------------------------------------------------

module cla_adder32(cout, sum, a, b);

output reg		cout;
output reg	[31:0]	sum;
input		[31:0]	a;
input		[31:0]	b;

wire co [30:0];


carry_look_ahead_adder cla_adder1(co[0], sum[0], a[0], b[0], 1'b0);
carry_look_ahead_adder cla_adder2(co[1], sum[1], a[1], b[1], co[0]);
carry_look_ahead_adder cla_adder3(co[2], sum[2], a[2], b[2], co[1]);
carry_look_ahead_adder cla_adder4(co[3], sum[3], a[3], b[3], co[2]);
carry_look_ahead_adder cla_adder5(co[4], sum[4], a[4], b[4], co[3]);
carry_look_ahead_adder cla_adder6(co[5], sum[5], a[5], b[5], co[4]);
carry_look_ahead_adder cla_adder7(co[6], sum[6], a[6], b[6], co[5]);
carry_look_ahead_adder cla_adder8(co[7], sum[7], a[7], b[7], co[6]);
carry_look_ahead_adder cla_adder9(co[8], sum[8], a[8], b[8], co[7]);
carry_look_ahead_adder cla_adder10(co[9], sum[9], a[9], b[9], co[8]);
carry_look_ahead_adder cla_adder11(co[10], sum[10], a[10], b[10], co[9]);
carry_look_ahead_adder cla_adder12(co[11], sum[11], a[11], b[11], co[10]);
carry_look_ahead_adder cla_adder13(co[12], sum[12], a[12], b[12], co[11]);
carry_look_ahead_adder cla_adder14(co[13], sum[13], a[13], b[13], co[12]);
carry_look_ahead_adder cla_adder15(co[14], sum[14], a[14], b[14], co[13]);
carry_look_ahead_adder cla_adder16(co[15], sum[15], a[15], b[15], co[14]);
carry_look_ahead_adder cla_adder17(co[16], sum[16], a[16], b[16], co[15]);
carry_look_ahead_adder cla_adder18(co[17], sum[17], a[17], b[17], co[16]);
carry_look_ahead_adder cla_adder19(co[18], sum[18], a[18], b[18], co[17]);
carry_look_ahead_adder cla_adder20(co[19], sum[19], a[19], b[19], co[18]);
carry_look_ahead_adder cla_adder21(co[20], sum[20], a[20], b[20], co[19]);
carry_look_ahead_adder cla_adder22(co[21], sum[21], a[21], b[21], co[20]);
carry_look_ahead_adder cla_adder23(co[22], sum[22], a[22], b[22], co[21]);
carry_look_ahead_adder cla_adder24(co[23], sum[23], a[23], b[23], co[22]);
carry_look_ahead_adder cla_adder25(co[24], sum[24], a[24], b[24], co[23]);
carry_look_ahead_adder cla_adder26(co[25], sum[25], a[25], b[25], co[24]);
carry_look_ahead_adder cla_adder27(co[26], sum[26], a[26], b[26], co[25]);
carry_look_ahead_adder cla_adder28(co[27], sum[27], a[27], b[27], co[26]);
carry_look_ahead_adder cla_adder29(co[28], sum[28], a[28], b[28], co[27]);
carry_look_ahead_adder cla_adder30(co[29], sum[29], a[29], b[29], co[28]);
carry_look_ahead_adder cla_adder31(co[30], sum[30], a[30], b[30], co[29]);
carry_look_ahead_adder cla_adder32(cout, sum[31], a[31], b[31], co[30]);

endmodule