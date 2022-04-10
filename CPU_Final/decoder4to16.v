module decoder4to16(Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I, En);

output reg Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

input [3:0] I;
input En;

wire w7, w6, w5, w4, w3, w2, w1, w0;

decoder3to8 decoder3to81(w7, w6, w5, w4, w3, w2, w1, w0, I[3], I[2], I[1], En);

decoder1to2 decoder7(Y15, Y14, I[0], w7);
decoder1to2 decoder6(Y13, Y12, I[0], w6);
decoder1to2 decoder5(Y11, Y10, I[0], w5);
decoder1to2 decoder4(Y9, Y8, I[0], w4);
decoder1to2 decoder3(Y7, Y6, I[0], w3);
decoder1to2 decoder2(Y5, Y4, I[0], w2);
decoder1to2 decoder1(Y3, Y2, I[0], w1);
decoder1to2 decoder0(Y1, Y0, I[0], w0);


endmodule

