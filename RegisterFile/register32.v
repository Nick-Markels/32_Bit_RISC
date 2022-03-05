module register32(D, Q, clk, reset, enable);
	
parameter WIDTH = 32;

	input [WIDTH-1:0] D;
	input clk, reset, enable;
	output [WIDTH-1:0] Q;


D_FF dff31(Q[31], D[31], clk, reset, enable);
D_FF dff30(Q[30], D[30], clk, reset, enable);
D_FF dff29(Q[29], D[29], clk, reset, enable);
D_FF dff28(Q[28], D[28], clk, reset, enable);
D_FF dff27(Q[27], D[27], clk, reset, enable);
D_FF dff26(Q[26], D[26], clk, reset, enable);
D_FF dff25(Q[25], D[25], clk, reset, enable);
D_FF dff24(Q[24], D[24], clk, reset, enable);
D_FF dff23(Q[23], D[23], clk, reset, enable);
D_FF dff22(Q[22], D[22], clk, reset, enable);
D_FF dff21(Q[21], D[21], clk, reset, enable);
D_FF dff20(Q[20], D[20], clk, reset, enable);
D_FF dff19(Q[19], D[19], clk, reset, enable);
D_FF dff18(Q[18], D[18], clk, reset, enable);
D_FF dff17(Q[17], D[17], clk, reset, enable);
D_FF dff16(Q[16], D[16], clk, reset, enable);
D_FF dff15(Q[15], D[15], clk, reset, enable);
D_FF dff14(Q[14], D[14], clk, reset, enable);
D_FF dff13(Q[13], D[13], clk, reset, enable);
D_FF dff12(Q[12], D[12], clk, reset, enable);
D_FF dff11(Q[11], D[11], clk, reset, enable);
D_FF dff10(Q[10], D[10], clk, reset, enable);
D_FF dff9(Q[9], D[9], clk, reset, enable);
D_FF dff8(Q[8], D[8], clk, reset, enable);
D_FF dff7(Q[7], D[7], clk, reset, enable);
D_FF dff6(Q[6], D[6], clk, reset, enable);
D_FF dff5(Q[5], D[5], clk, reset, enable);
D_FF dff4(Q[4], D[4], clk, reset, enable);
D_FF dff3(Q[3], D[3], clk, reset, enable);
D_FF dff2(Q[2], D[2], clk, reset, enable);
D_FF dff1(Q[1], D[1], clk, reset, enable);
D_FF dff0(Q[0], D[0], clk, reset, enable);

endmodule