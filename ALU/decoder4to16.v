module decoder4to16(Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I, En);

output reg Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

input [3:0] I;
input En;

wire w0, w1, w2, w3, w4, w5, w6, w7;

decoder3to8 decoder3to81(w7, w6, w5, w4, w3, w2, w1, w0, I[3], I[2], I[1], En);

decoder1to2 decoder1to21(Y1, Y0, I[0], w0);
decoder1to2 decoder1to22(Y3, Y2, I[0], w1);
decoder1to2 decoder1to23(Y5, Y4, I[0], w2);
decoder1to2 decoder1to24(Y7, Y6, I[0], w3);
decoder1to2 decoder1to25(Y9, Y8, I[0], w4);
decoder1to2 decoder1to26(Y11, Y10, I[0], w5);
decoder1to2 decoder1to27(Y13, Y12, I[0], w6);
decoder1to2 decoder1to28(Y15, Y14, I[0], w7);

endmodule

