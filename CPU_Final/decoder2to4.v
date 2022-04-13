module decoder2to4(Y3, Y2, Y1, Y0, I1, I0, En);

output reg Y3, Y2, Y1, Y0;

input I1, I0, En;

wire w1, w0 ;

	decoder1to2 decoder2(Y3, Y2, I0, w1);
	decoder1to2 decoder1(Y1, Y0, I0, w0);
	decoder1to2 decoder0(w1, w0, I1, En);

endmodule