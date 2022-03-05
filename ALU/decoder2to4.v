module decoder2to4(Y3, Y2, Y1, Y0, I1, I0, En);

output reg Y3, Y2, Y1, Y0;

input I1, I0, En;

wire w0, w1;

	decoder1to2 decoder1to21(w1, w0, I1, En);
	decoder1to2 decoder1to22(Y1, Y0, I0, w0);
	decoder1to2 decoder1to23(Y3, Y2, I0, w1);

endmodule