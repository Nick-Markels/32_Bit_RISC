// -----------------------------------------------------------
//	Module:		32 x 32 Register File Testbench
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		March 1, 2022
// ----------------------------------------------------------

`timescale 1ns/1ns

module register_file32_tb;

wire [31:0] out1;
wire [31:0] out0;
reg  [31:0] in;
reg	    wen;
reg  [4:0]  wsel;
reg  [4:0]  asel;
reg  [4:0]  bsel;
reg         clk;
reg         reset;

register_file32 register_file1(out1, out0, in, wen, wsel, asel, bsel, clk, reset);

initial
    begin
        clk = 0;
        forever #10 clk = !clk;
    end

initial
  begin
	#10 reset = 1; 
	//Write 8888 to R8
	#20 wsel = 5'b01000; wen = 1'b1; in = 32'h00008888;

	//Write 3333 to R3
	#20 wsel = 5'b00011; wen = 1'b1; in = 32'h00003333;
	
	//Write 7777 to R7
	#20 wsel = 5'b00111; wen = 1'b1; in = 32'h00007777;

	//Write 6666 to R6
	#20 wsel = 5'b00110; wen = 1'b1; in = 32'h00006666;

	//Read R3 to output bus A and R8 to output bus B
	#20 wen = 1'b0;
	#20 asel = 5'b00011; bsel = 5'b01000;

	//Write 2222 to R2
	#20 wsel = 5'b00010; wen = 1'b1; in = 32'h00002222;
	
	//Write 9999 to R9
	#20 wsel = 5'b01001; wen = 1'b1; in = 32'h00009999;

	//Read R9 to output busses A and B
	#20 wen = 1'b0;
	#20 asel = 5'b01001; bsel = 5'b01001;

	//Write 2727 to R27
	#20 wsel = 5'b11011; wen = 1'b1; in = 32'h0002727;

	//Read R27 to output busses A and B
	#20 wen = 1'b0;
	#20 asel = 5'b11011; bsel = 5'b11011;

	//Write FFFF to R31
	#20 wsel = 5'b11111; wen = 1'b1; in = 32'h0000FFFF;

	//Read R31 to output busses A and B
	#20 wen = 1'b0;
	#20 asel = 5'b11111; bsel = 5'b11111;

	//Write 5A5A to R9
	#20 wsel = 5'b01001; wen = 1'b1; in = 32'h00005A5A;

	//Read R9 to output busses A and B
	#20 wen = 1'b0;
	#20 asel = 5'b01001; bsel = 5'b01001;
	
	#10 $stop;
  end

endmodule