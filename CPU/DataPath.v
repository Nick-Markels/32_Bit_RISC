module DataPath(irInput, dataInput, clk, registerFileSelect);

parameter WIDTH = 32;

	input [WIDTH-1:0] dataInput;
	input [WIDTH-1:0] irInput;
	input registerFileSelect;
	wire [WIDTH-1:0] aluOutput;
	input clk;
	
wire [WIDTH-1:0] aluA;
wire [WIDTH-1:0] aluB;
wire [WIDTH-1:0] irOut;
wire [WIDTH-1:0] registerFileInput;




wire reset;
assign reset = 'b1;
assign wen = 'b1;

	IR ir1(irInput, irOut, clk, reset);
	
	mux2_to_1 mx1(registerFileInput, dataInput, aluOutput, registerFileSelect);

	register_file32 rgf1(aluA, aluB, registerFileInput, wen, irOut[25:21], irOut[20:16], irOut[15:11], clk, reset);

	alu32 alu1(aluOutput, aluA, aluB, irOut[29], irOut[28], irOut[27], irOut[26]);

endmodule

