//----------------------------------------------
// CPU Data Path
// 
// Authors: Jude Gabriel, Nick Markels
//--------------------------------------------



module DataPath(compOut, addOut, irOut, pcFetch, pcEn, pcIncSel, pcAddSel, pcRegSel, irEn, marEn, ldEn, stEn, mdrEn, dataRAM, wr, wEn, clk, reset);

parameter WIDTH = 32;

	//Outputs to RAM
	output [WIDTH-1:0] addOut;

	//Data from RAM
	inout [WIDTH-1:0] dataRAM;

	//Outputs to Controller
	output wire [WIDTH-1:0] irOut;

	//Inputs from Controller
	input wr;
	input wEn;
	wire [WIDTH-1:0] aluOutput;
	wire [WIDTH-1:0] aluAndMdrOut;
	input clk;
	
//Left Hand side
input irEn;
wire [WIDTH-1:0] aluA;
wire [WIDTH-1:0] aluBIn;
wire [WIDTH-1:0] aluBOut;
wire [WIDTH-1:0] signExt;
wire [WIDTH-1:0] registerFileInput;

//Right Hand Side
input marEn;
wire [WIDTH-1:0] mdrOut;
wire [WIDTH-1:0] mdrIn;
wire [WIDTH-1:0] rcOut;
wire notWr;
wire rdAndNotWr;
wire notRd;
wire notRdAndWr;
wire rdOrWr;
input ldEn;
input stEn;
input mdrEn;

//Inputs to PC 
input pcFetch;
input pcEn;
input pcIncSel;            //Chooses to load PC with either internal data or external data
input pcAddSel;		   //Choosers to add 4 or sign ext literal to curr pc value
input pcRegSel;           //Chooses either register A or register C as inputs to PC
wire [WIDTH-1:0] pcIn;   //Connects register select mux to input of PC

//Outputs from PC
wire [WIDTH-1:0] pcOut;

//Input to MAR
wire [WIDTH-1:0] marIn;

//Inputs into comparator
wire [31:0] r31Out;  //Output from register 31 into comparator

//Output flag from comparator 
output compOut;


input reset;




	//------------ LEFT HAND SIDE DP ------------//

	//Instruction Register
	IR ir1(dataRAM, irOut, clk, irEn, reset);

	//Mux that decides input to register file
	mux2_to_1 rgfMUX(registerFileInput, pcOut, aluAndMdrOut, pcIncSel);
	
	
	//Register File
	register_file32 rgf1(aluA, aluBIn, rcOut, r31Out, registerFileInput, wEn, irOut[25:21], irOut[20:16], irOut[15:11], irOut[25:21], clk, reset);

	//Get the correct sign extension
	mux2_to_1 muxSignExt(signExt, {'hFFFF, irOut[15:0]}, {'h0000, irOut[15:0]}, irOut[15]);
	
	//Select either sign extension or register file value to send to ALU
	mux2_to_1 muxALUIn(aluBOut, signExt, aluBIn, irOut[30]);

	//ALU
	alu32 alu1(aluOutput, aluA, aluBOut, irOut[29], irOut[28], irOut[27], irOut[26]);

	//Comparator
	comparator comp1(compOut, aluA, r31Out);

	


	//------------ RIGHT HAND SIDE DP ------------//
	//Note: We are getting addresses from Ra

	//Memory Address Register gets bits [7:2] as the address from MUX A
	MAR mar(marIn, addOut, clk, marEn, reset);          //addOut is output to RAM


	//Memory Data Register
	bufif32 b1(mdrIn, dataRAM, ldEn);                   //Load Buffer
	bufif32 b2(mdrIn, rcOut, stEn);                     //Store Buffer
	MDR mdr(mdrIn, mdrOut, clk, reset, mdrEn);          //MDR - mdrOut goes to RAM and register file
	bufif32 b3(dataRAM, mdrOut, wr); 		    //MDR Output buffer to RAM

	bufif_not32 b4(aluAndMdrOut, mdrOut, irOut[31]);    //Send data to register file from MAR -irOut[31] high, first two opclasses
	bufif32     b5(aluAndMdrOut, aluOutput, irOut[31]); //Send data to register file from ALU -irOut[31] low, last opclass


	//PC Connections
	mux2_to_1 pcInMux(pcIn, aluA, rcOut, pcRegSel);                         //Selects the input register for the PC
	PC pc(pcOut, pcIn, pcIncSel, signExt, pcAddSel, clk, reset, pcEn);     //PC
	mux2_to_1 muxMARIn(marIn, pcOut, aluA, pcFetch);                      //Choose the output for the MAR


endmodule

