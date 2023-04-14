// -----------------------------------------------------------
//	Module:		Testbench for 8-1 MUX
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		February 5, 2022
// ----------------------------------------------------------

module mux8_to_1_tb;

reg [31:0] 	 a;
reg [31:0] 	 b;
reg [31:0] 	 c;
reg [31:0] 	 d;
reg [31:0] 	 e;
reg [31:0]  	 f;
reg [31:0] 	 g;
reg [31:0] 	 h;
reg        	 s2;
reg        	 s1;
reg        	 s0;
wire [31:0]      z;

mux8_to_1 mux1(z, a, b, c, d, e, f, g, h, s2, s1, s0);

initial
  begin
	//Select 000
	#10 s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'h00000000; d = 32'h00000000; e = 32'h00000000; f = 32'h00000000; g = 32'h00000000; h = 32'hFFFFFFFF;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'h00000000;
	
	//Select 001
	#10 s2 = 1'b0; s1 = 1'b0; s0 = 1'b1;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'h00000000; d = 32'h00000000; e = 32'h00000000; f = 32'h00000000; g = 32'hFFFFFFFF; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'h00000000; h = 32'hFFFFFFFF;

	//Select 010
	#10 s2 = 1'b0; s1 = 1'b1; s0 = 1'b0;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'h00000000; d = 32'h00000000; e = 32'h00000000; f = 32'hFFFFFFFF; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'h00000000; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;

	//Selct 011
	#10 s2 = 1'b0; s1 = 1'b1; s0 = 1'b1;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'h00000000; d = 32'h00000000; e = 32'hFFFFFFFF; f = 32'h00000000; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'h00000000; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;

	//Select 100
	#10 s2 = 1'b1; s1 = 1'b0; s0 = 1'b0;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'h00000000; d = 32'hFFFFFFFF; e = 32'h00000000; f = 32'h00000000; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'h00000000; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;

	//Select 101
	#10 s2 = 1'b1; s1 = 1'b0; s0 = 1'b1;
		#10 a = 32'h00000000; b = 32'h00000000; c = 32'hFFFFFFFF; d = 32'h00000000; e = 32'h00000000; f = 32'h00000000; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; c = 32'h00000000; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;

	//Select 110
	#10 s2 = 1'b1; s1 = 1'b1; s0 = 1'b0;
		#10 a = 32'h00000000; b = 32'hFFFFFFFF; c = 32'h00000000; d = 32'h00000000; e = 32'h00000000; f = 32'h00000000; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'hFFFFFFFF; b = 32'h00000000; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;

	//Select 111
	#10 s2 = 1'b1; s1 = 1'b1; s0 = 1'b1;
		#10 a = 32'hFFFFFFFF; b = 32'h00000000; c = 32'h00000000; d = 32'h00000000; e = 32'h00000000; f = 32'h00000000; g = 32'h00000000; h = 32'h00000000;
		#10 a = 32'h00000000; b = 32'hFFFFFFFF; c = 32'hFFFFFFFF; d = 32'hFFFFFFFF; e = 32'hFFFFFFFF; f = 32'hFFFFFFFF; g = 32'hFFFFFFFF; h = 32'hFFFFFFFF;
	#10 $stop;
  end

initial
  begin
	$display("		  time 		a b c d e f g h s3 s2 s1 s0   		z");
	$monitor($time,, a,, b,, c,, d,, e,, f,, g,, h,, s2,, s1,, s0,,,,,, z);
  end

endmodule
	
