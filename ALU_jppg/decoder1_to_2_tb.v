// -----------------------------------------------------------
//	Module:		Testbench for 1:2 Decoder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

`timescale 1ns/1ns

module decoder1_to_2_tb;

reg x;
reg en;
wire y1;
wire y0;

decoder1_to_2 decoder1(y1, y0, x, en);

initial 
  begin
	#10 x = 1'b0;	en = 1'b0;
	#10 x = 1'b0;	en = 1'b1;
	#10 x = 1'b1;	en = 1'b0;
	#10 x = 1'b1;	en = 1'b1;
	#10 $stop;
  end 


initial
  begin
	$display("	time	x en y1 y0");
	$monitor($time,, x,, en,,,,,, y1,,,,,, y0);
  end

endmodule
    