module decoder1to2(Y1, Y0, I0, En);

output reg Y1, Y0;

input I0, En;

wire w1;

and a1(Y1, I0, En);
not n1(w1, I0);
and a2(Y0, En, w1);

endmodule

