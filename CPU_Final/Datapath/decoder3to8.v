module decoder3to8(Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I2, I1, I0, En);

output reg Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

input I2, I1, I0, En;

wire w3, w2, w1, w0;

	decoder2to4 decoder2to40(w3, w2, w1, w0, I2, I1, En);
	
	decoder1to2 decoder3(Y7, Y6, I0, w3);
	decoder1to2 decoder2(Y5, Y4, I0, w2);
	decoder1to2 decoder1(Y3, Y2, I0, w1);
	decoder1to2 decoder0(Y1, Y0, I0, w0);
	


endmodule