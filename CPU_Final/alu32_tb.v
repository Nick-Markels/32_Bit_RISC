// -----------------------------------------------------------
//	Module:		Testbench for 32-Bit ALU
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 4, 2022
// ----------------------------------------------------------

`timescale 1ns/1ns

module alu32_tb;

reg [31:0]    a;
reg [31:0]    b;
reg 	      s3;
reg           s2;
reg           s1;
reg           s0;
wire [31:0]   c;

alu32 alu(c, a, b, s3, s2, s1, s0);

initial 
  begin
	//Test Adder
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test Subtractor
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b0; s1 = 1'b0; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 0010
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b0; s1 = 1'b1; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 0011
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b0; s1 = 1'b1; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;
	
	//Test select 0100
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b1; s1 = 1'b0; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 0101
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b1; s1 = 1'b0; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 0110
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b1; s1 = 1'b1; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 0111
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b0; s2 = 1'b1; s1 = 1'b1; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test AND
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test OR
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b0; s1 = 1'b0; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test XOR
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b0; s1 = 1'b1; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test XNOR
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b0; s1 = 1'b1; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test Shift Left
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b1; s1 = 1'b0; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test Shift Right
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b1; s1 = 1'b0; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test Shift Right with Sign Extension
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b1; s1 = 1'b1; s0 = 1'b0;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;

	//Test select 1111
	#10 a = 32'h00000000; 	b = 32'h00000000; s3 = 1'b1; s2 = 1'b1; s1 = 1'b1; s0 = 1'b1;
	#10 a = 32'h00000001;	b = 32'h00000001;
	#10 a = 32'h00000000;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFFFFFFF;	b = 32'h00000000;
	#10 a = 32'hFFFFFFFF;	b = 32'hFFFFFFFF;
	#10 a = 32'hFFDF1F40;	b = 32'h80031F4F;
	#10 a = 32'h07FA07FD;	b = 32'h80C01F07;
	#10 a = 32'hF8983F21;	b = 32'h9210FDBC;
	#10 a = 32'h23489ABC;	b = 32'h12AFE847;
	#10 a = 32'h56FDA350; 	b = 32'h12FDED00;
	#10 $stop;
  end


initial
  begin
	$display("		  time 		a b s3 s2 s1 s0   		c");
	$monitor($time,, a,, b,,,,,, s3,,,,,, s2,,,,,, s1,,,,,, s0,,,,,, c);
  end

endmodule
	