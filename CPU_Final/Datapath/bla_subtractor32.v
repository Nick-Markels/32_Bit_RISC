// -----------------------------------------------------------
//	Module:		32-Bit Borrow-Look-Ahead Subtractor
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

module bla_subtractor32(bout, diff, a, b);

output reg		bout;
output reg [31:0]	diff;
input 	   [31:0]	a;
input      [31:0]	b;

wire bo [30:0];


borrow_look_ahead_subtractor bla_subtractor1(bo[0], diff[0], a[0], b[0], 1'b0);
borrow_look_ahead_subtractor bla_subtractor2(bo[1], diff[1], a[1], b[1], bo[0]);
borrow_look_ahead_subtractor bla_subtractor3(bo[2], diff[2], a[2], b[2], bo[1]);
borrow_look_ahead_subtractor bla_subtractor4(bo[3], diff[3], a[3], b[3], bo[2]);
borrow_look_ahead_subtractor bla_subtractor5(bo[4], diff[4], a[4], b[4], bo[3]);
borrow_look_ahead_subtractor bla_subtractor6(bo[5], diff[5], a[5], b[5], bo[4]);
borrow_look_ahead_subtractor bla_subtractor7(bo[6], diff[6], a[6], b[6], bo[5]);
borrow_look_ahead_subtractor bla_subtractor8(bo[7], diff[7], a[7], b[7], bo[6]);
borrow_look_ahead_subtractor bla_subtractor9(bo[8], diff[8], a[8], b[8], bo[7]);
borrow_look_ahead_subtractor bla_subtractor10(bo[9], diff[9], a[9], b[9], bo[8]);
borrow_look_ahead_subtractor bla_subtractor11(bo[10], diff[10], a[10], b[10], bo[9]);
borrow_look_ahead_subtractor bla_subtractor12(bo[11], diff[11], a[11], b[11], bo[10]);
borrow_look_ahead_subtractor bla_subtractor13(bo[12], diff[12], a[12], b[12], bo[11]);
borrow_look_ahead_subtractor bla_subtractor14(bo[13], diff[13], a[13], b[13], bo[12]);
borrow_look_ahead_subtractor bla_subtractor15(bo[14], diff[14], a[14], b[14], bo[13]);
borrow_look_ahead_subtractor bla_subtractor16(bo[15], diff[15], a[15], b[15], bo[14]);
borrow_look_ahead_subtractor bla_subtractor17(bo[16], diff[16], a[16], b[16], bo[15]);
borrow_look_ahead_subtractor bla_subtractor18(bo[17], diff[17], a[17], b[17], bo[16]);
borrow_look_ahead_subtractor bla_subtractor19(bo[18], diff[18], a[18], b[18], bo[17]);
borrow_look_ahead_subtractor bla_subtractor20(bo[19], diff[19], a[19], b[19], bo[18]);
borrow_look_ahead_subtractor bla_subtractor21(bo[20], diff[20], a[20], b[20], bo[19]);
borrow_look_ahead_subtractor bla_subtractor22(bo[21], diff[21], a[21], b[21], bo[20]);
borrow_look_ahead_subtractor bla_subtractor23(bo[22], diff[22], a[22], b[22], bo[21]);
borrow_look_ahead_subtractor bla_subtractor24(bo[23], diff[23], a[23], b[23], bo[22]);
borrow_look_ahead_subtractor bla_subtractor25(bo[24], diff[24], a[24], b[24], bo[23]);
borrow_look_ahead_subtractor bla_subtractor26(bo[25], diff[25], a[25], b[25], bo[24]);
borrow_look_ahead_subtractor bla_subtractor27(bo[26], diff[26], a[26], b[26], bo[25]);
borrow_look_ahead_subtractor bla_subtractor28(bo[27], diff[27], a[27], b[27], bo[26]);
borrow_look_ahead_subtractor bla_subtractor29(bo[28], diff[28], a[28], b[28], bo[27]);
borrow_look_ahead_subtractor bla_subtractor30(bo[29], diff[29], a[29], b[29], bo[28]);
borrow_look_ahead_subtractor bla_subtractor31(bo[30], diff[30], a[30], b[30], bo[29]);
borrow_look_ahead_subtractor bla_subtractor32(bout, diff[31], a[31], b[31], bo[30]);

endmodule