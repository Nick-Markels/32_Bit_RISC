// -----------------------------------------------------------
//	Module:		Testbench for 2:4 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

`timescale 1ns/1ns

module decoder2_to_4_tb;

reg a;
reg b;
reg en;
wire y3;
wire y2;
wire y1;
wire y0;

decoder2_to_4 decoder1(y3, y2, y1, y0, a, b, en);

initial 
  begin 
	#10 en = 1'b0;
	#10 a = 1'b0;	b = 1'b0;
	#10 a = 1'b0;	b = 1'b1;
	#10 a = 1'b1;	b = 1'b0;
	#10 a = 1'b1;	b = 1'b1;

	#10 en = 1'b1;
	#10 a = 1'b0;	b = 1'b0;
	#10 a = 1'b0;	b = 1'b1;
	#10 a = 1'b1;	b = 1'b0;
	#10 a = 1'b1;	b = 1'b1;
	#10 $stop;
  end

initial
  begin
	$display("	time a b en	y3	y2	y1	y0");
	$monitor($time,, a,, b,, en,,,,,, y3,,,,,, y2,,,,,, y1,,,,,, y0);
  end

endmodule
    