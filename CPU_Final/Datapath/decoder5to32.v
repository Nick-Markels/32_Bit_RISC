module decoder5to32(Y31, Y30, Y29, Y28, Y27, Y26, Y25, Y24, Y23, Y22, Y21, Y20, Y19, Y18, Y17, Y16, Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I, En);

output reg Y31, Y30, Y29, Y28, Y27, Y26, Y25, Y24, Y23, Y22, Y21, Y20, Y19, Y18, Y17, Y16, Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

input [4:0] I;

input En;
//assign En = 1'b1;

wire w15, w14, w13, w12, w11, w10, w9, w8, w7, w6, w5, w4, w3, w2, w1, w0;

decoder4to16 decoder4to161(w15, w14, w13, w12, w11, w10, w9, w8, w7, w6, w5, w4, w3, w2, w1, w0, I[4:1], En);

decoder1to2 decoder15(Y31, Y30, I[0], w15);
decoder1to2 decoder14(Y29, Y28, I[0], w14);
decoder1to2 decoder13(Y27, Y26, I[0], w13);
decoder1to2 decoder12(Y25, Y24, I[0], w12);
decoder1to2 decoder11(Y23, Y22, I[0], w11);
decoder1to2 decoder10(Y21, Y20, I[0], w10);
decoder1to2 decoder9(Y19, Y18, I[0], w9);
decoder1to2 decoder8(Y17, Y16, I[0], w8);
decoder1to2 decoder7(Y15, Y14, I[0], w7);
decoder1to2 decoder6(Y13, Y12, I[0], w6);
decoder1to2 decoder5(Y11, Y10, I[0], w5);
decoder1to2 decoder4(Y9, Y8, I[0], w4);
decoder1to2 decoder3(Y7, Y6, I[0], w3);
decoder1to2 decoder2(Y5, Y4, I[0], w2);
decoder1to2 decoder1(Y3, Y2, I[0], w1);
decoder1to2 decoder0(Y1, Y0, I[0], w0);


endmodule 