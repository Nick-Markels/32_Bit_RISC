// ------------------------------------------------------------------
//	Module:		Testbench for 1-Bit Carry-Look-Ahead Adder
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 3, 2022
// -----------------------------------------------------------------

`timescale 1ns /1ns

module adder_tb;

reg	a;
reg	b;
reg	cin;

wire	cout;
wire	sum;

carry_look_ahead_adder carry_look_ahead_adder1(cout, sum, a, b, cin);

initial
  begin
	#10 a = 0; b = 0; cin = 0;
	#10 a = 0; b = 0; cin = 1;
	#10 a = 0; b = 1; cin = 0;
	#10 a = 0; b = 1; cin = 1;
	#10 a = 1; b = 0; cin = 0;
	#10 a = 1; b = 0; cin = 1;
	#10 a = 1; b = 1; cin = 0;
	#10 a = 1; b = 1; cin = 1;
	#10 $stop;
  end

initial
  begin
	$display("	time a  b  cin cout sum ");
	$monitor($time,, a,,, b,,, cin,,,,,, cout,,,,,, sum);
  end

endmodule
		