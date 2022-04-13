// -----------------------------------------------------------
//	Module:		32 x 32 Register File
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		March 1, 2022
// ----------------------------------------------------------

module register_file32(out1, out0, outC, r31Out, in, wen, wsel, asel, bsel, csel, clk, reset);

output [31:0] out1;
output [31:0] out0;
output [31:0] outC;
input  [31:0] in;
input	      wen;
input  [4:0]  wsel;
input  [4:0]  asel;
input  [4:0]  bsel;
input  [4:0]  csel;
input         clk;
input         reset;


wire        d_out   [31:0];
wire [31:0] reg_out [31:0];

output reg [31:0] r31Out;

//Instantiate a decoder to send data to correct register
decoder5to32 decoder(d_out[31], d_out[30], d_out[29], d_out[28], d_out[27], d_out[26], d_out[25], d_out[24], d_out[23], d_out[22], 
			d_out[21], d_out[20], d_out[19], d_out[18], d_out[17], d_out[16], d_out[15], d_out[14], d_out[13], 
			d_out[12], d_out[11], d_out[10], d_out[9], d_out[8], d_out[7], d_out[6], d_out[5], d_out[4], 
			d_out[3], d_out[2], d_out[1], d_out[0], wsel, wen);

//Initialize registers
register32 reg31('h0, r31Out, clk, reset, 1'b1);
register32 reg30(10'h512, reg_out[30], clk, reset, d_out[30]); 
register32 reg29(10'h204, reg_out[29], clk, reset, d_out[29]); 
register32 reg28(in, reg_out[28], clk, reset, d_out[28]); 
register32 reg27(in, reg_out[27], clk, reset, d_out[27]); 
register32 reg26(in, reg_out[26], clk, reset, d_out[26]); 
register32 reg25(in, reg_out[25], clk, reset, d_out[25]);
register32 reg24(in, reg_out[24], clk, reset, d_out[24]);
register32 reg23(in, reg_out[23], clk, reset, d_out[23]);
register32 reg22(in, reg_out[22], clk, reset, d_out[22]);
register32 reg21(in, reg_out[21], clk, reset, d_out[21]);
register32 reg20(in, reg_out[20], clk, reset, d_out[20]);
register32 reg19(in, reg_out[19], clk, reset, d_out[19]);
register32 reg18(in, reg_out[18], clk, reset, d_out[18]);
register32 reg17(in, reg_out[17], clk, reset, d_out[17]);
register32 reg16(in, reg_out[16], clk, reset, d_out[16]);
register32 reg15(in, reg_out[15], clk, reset, d_out[15]);
register32 reg14(in, reg_out[14], clk, reset, d_out[14]);
register32 reg13(in, reg_out[13], clk, reset, d_out[13]);
register32 reg12(in, reg_out[12], clk, reset, d_out[12]);
register32 reg11(in, reg_out[11], clk, reset, d_out[11]);
register32 reg10(in, reg_out[10], clk, reset, d_out[10]);
register32 reg9(in, reg_out[9], clk, reset, d_out[9]);
register32 reg8(in, reg_out[8], clk, reset, d_out[8]);
register32 reg7(in, reg_out[7], clk, reset, d_out[7]);
register32 reg6(in, reg_out[6], clk, reset, d_out[6]);
register32 reg5(in, reg_out[5], clk, reset, d_out[5]);
register32 reg4(in, reg_out[4], clk, reset, d_out[4]);
register32 reg3(in, reg_out[3], clk, reset, d_out[3]);
register32 reg2(in, reg_out[2], clk, reset, d_out[2]);
register32 reg1(in, reg_out[1], clk, reset, d_out[1]);
register32 reg0(in, reg_out[0], clk, reset, d_out[0]);



//Send outputs from registers to 32-bit MUX's with corresponding select lines
mux32_to_1 mux1(out1, reg_out[31], reg_out[30], reg_out[29], reg_out[28], reg_out[27], reg_out[26], 
		reg_out[25], reg_out[24], reg_out[23], reg_out[22], reg_out[21], reg_out[20], reg_out[19], 
		reg_out[18], reg_out[17], reg_out[16], reg_out[15], reg_out[14], reg_out[13], reg_out[12], 
		reg_out[11], reg_out[10], reg_out[9], reg_out[8], reg_out[7], reg_out[6], reg_out[5], reg_out[4], 
		reg_out[3], reg_out[2], reg_out[1], reg_out[0], asel[4], asel[3], asel[2], asel[1], asel[0]);

mux32_to_1 mux0(out0, reg_out[31], reg_out[30], reg_out[29], reg_out[28], reg_out[27], reg_out[26], 
		reg_out[25], reg_out[24], reg_out[23], reg_out[22], reg_out[21], reg_out[20], reg_out[19], 
		reg_out[18], reg_out[17], reg_out[16], reg_out[15], reg_out[14], reg_out[13], reg_out[12], 
		reg_out[11], reg_out[10], reg_out[9], reg_out[8], reg_out[7], reg_out[6], reg_out[5], reg_out[4], 
		reg_out[3], reg_out[2], reg_out[1], reg_out[0], bsel[4], bsel[3], bsel[2], bsel[1], bsel[0]);

mux32_to_1 muxC(outC, reg_out[31], reg_out[30], reg_out[29], reg_out[28], reg_out[27], reg_out[26], 
		reg_out[25], reg_out[24], reg_out[23], reg_out[22], reg_out[21], reg_out[20], reg_out[19], 
		reg_out[18], reg_out[17], reg_out[16], reg_out[15], reg_out[14], reg_out[13], reg_out[12], 
		reg_out[11], reg_out[10], reg_out[9], reg_out[8], reg_out[7], reg_out[6], reg_out[5], reg_out[4], 
		reg_out[3], reg_out[2], reg_out[1], reg_out[0], csel[4], csel[3], csel[2], csel[1], csel[0]);

endmodule