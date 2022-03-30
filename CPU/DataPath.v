module DataPath(irInput, dataInput, wEn, clk, registerFileSelect);

parameter WIDTH = 32;

	input [WIDTH-1:0] dataInput;
	input [WIDTH-1:0] irInput;
	input registerFileSelect;
	input wEn;
	wire [WIDTH-1:0] aluOutput;
	input clk;
	
wire [WIDTH-1:0] aluA;
wire [WIDTH-1:0] aluBIn;
wire [WIDTH-1:0] aluBOut;
wire [WIDTH-1:0] irOut;
wire [WIDTH-1:0] registerFileInput;

wire [WIDTH-1:0] signExt;// = {16'b0, irOut[15:0]};


wire reset;
assign reset = 'b1;

	//Instruction Register
	IR ir1(irInput, irOut, clk, reset);
	
	//MUX to populate registers with inital data
	mux2_to_1 mx1(registerFileInput, dataInput, aluOutput, registerFileSelect);
	
	//Register File
	register_file32 rgf1(aluA, aluBIn, registerFileInput, wEn, irOut[25:21], irOut[20:16], irOut[15:11], clk, reset);

	//Get the correct sign extension
	mux2_to_1 mux3(signExt, {'hFFFF, irOut[15:0]}, {'h0000, irOut[15:0]}, irOut[15]);
	
	//Select either sign extension or register file value to send to ALU
	mux2_to_1 mux2(aluBOut, signExt, aluBIn, irOut[30]);

	//ALU
	alu32 alu1(aluOutput, aluA, aluBOut, irOut[29], irOut[28], irOut[27], irOut[26]);

endmodule

