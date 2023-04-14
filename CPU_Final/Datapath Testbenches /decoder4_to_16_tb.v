// -----------------------------------------------------------
//	Module:		Testbench for 4:16 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

`timescale 1ns/1ns

module decoder4_to_16_tb;

reg a, b, c, d;
wire y15, y14, y13, y12, y11, y10, y9, y8, y7, y6, y5, y4, y3, y2, y1, y0;

decoder4_to_16 decoder1(y15, y14, y13, y12, y11, y10, y9, y8, y7, y6, y5, y4, y3, y2, y1, y0, a, b, c, d);

initial 
  begin
	#10 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
	#10 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
	#10 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
	#10 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1;
	#10 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0;
	#10 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1;
	#10 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0;
	#10 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1;
	#10 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0;
	#10 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1;
	#10 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0;
	#10 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1;
	#10 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0;
	#10 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
	#10 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0;
	#10 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;
	#10 $stop;
  end

initial
  begin
	$display("	time     a b c d	y15 y14 y13 y12 y11 y10 y9 y8 y7 y6 y5 y4 y3 y2 y1 y0");
	$monitor($time,, a,, b,, c,, d,,,,,, y15,,,,,, y14,,,,,, y13,,,,,, y12,,,,,, y11,,,,,, y10,,,,,,
			y9,,,,,, y8,,,,,, y7,,,,,, y6,,,,,, y5,,,,,, y4,,,,,, y3,,,,,, y2,,,,,, y1,,,,,, y0);
  end

endmodule 
				