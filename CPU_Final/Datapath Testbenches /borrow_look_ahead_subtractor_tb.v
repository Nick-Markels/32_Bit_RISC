// -----------------------------------------------------------------------
//	Module:		Testbench for 1-Bit Borrow-Look-Ahead Subtractor
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// -----------------------------------------------------------------------

`timescale 1ns /1ns


module subtractor_tb;

reg	a;
reg	b;
reg	bin;

wire	bout;
wire	diff;

borrow_look_ahead_subtractor borrow_look_ahead_subtractor1(bout, diff, a, b, bin);

initial
  begin
	#10 a = 0; b = 0; bin = 0;
	#10 a = 0; b = 0; bin = 1;
	#10 a = 0; b = 1; bin = 0;
	#10 a = 0; b = 1; bin = 1;
	#10 a = 1; b = 0; bin = 0;
	#10 a = 1; b = 0; bin = 1;
	#10 a = 1; b = 1; bin = 0;
	#10 a = 1; b = 1; bin = 1;
	#10 $stop;
  end

initial
  begin
	$display("	time 	a  b  bin	 bout   diff ");
	$monitor($time,, a,,, b,,, bin,,,,,, bout,,,,,, diff);
  end

endmodule