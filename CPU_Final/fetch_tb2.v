//--------------------------------------
// Testbench for fetch controller with data path
//
// Authors: Jude Gabriel, Nick Markels 
//--------------------------------------

`timescale 1ns / 1ns

module main_controller_tb;

parameter WIDTH = 32;


reg clk;
reg reset;
reg [WIDTH-1:0] addrIn;
reg [WIDTH-1:0] dataTemp;
reg go_contr;
reg wrIn;




CPU cpu(addrIn, dataTemp, wrIn, clk, reset, go_contr);
initial
	begin
		clk = 0;
		forever #10 clk = !clk;
	end 

initial
	begin 

	#10 reset = 1'b0;
	#10 reset = 1'b1;

	//Add R2 and R1, store in R3
	#20 dataTemp[31:26] = 'b100000;		dataTemp[25:21] = 'h3; 	dataTemp[20:16] = 'h2; 		dataTemp[15:11] = 'h1; 		dataTemp[10:0] = 'h0; 		 addrIn = 'h0;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Load Ram slot 0 into R4
	#20 dataTemp[31:26] = 'b011000;		dataTemp[25:21] = 'h4; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'h0; 	 	 addrIn = 'h4; 	
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Store R0 into Ram slot 0 
	#20 dataTemp[31:26] = 'b011001;		dataTemp[25:21] = 'h0; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'h0;   	addrIn = 'h8;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Perform a jump: Store program Counter + 4 in R5, store R0 in Program Counter
	//#20 dataTemp[31:26] = 'b011011;		dataTemp[25:21] = 'h5;	dataTemp[20:16] = 'h0;		dataTemp[15:0] = 'h0;		addrIn = 'hC;
	//#20 wrIn = 'b1;
	//#20 wrIn = 'b0;

	//Perform a jump: Store program Counter + 4 in R6, store R5 in Program Counter
	//#20 dataTemp[31:26] = 'b011011;		dataTemp[25:21] = 'h6;	dataTemp[20:16] = 'h5;		dataTemp[15:0] = 'h0;		addrIn = 'h10;
	//#20 wrIn = 'b1;
	//#20 wrIn = 'b0;

	//Perform a BEQ: Store PC + 4 in R7, have Reg Ra be R0, have constant be -4
	//#20 dataTemp[31:26] = 'b011100;		dataTemp[25:21] = 'h7;	dataTemp[20:16] = 'h0;		dataTemp[15:0] = 16'b1111111111111100;		addrIn = 'hC;
	//#20 wrIn = 'b1;
	//#20 wrIn = 'b0;

	//Perform a BNE: Store PC+4 in R7, have reg Ra be R3, have constant be -4
	#20 dataTemp[31:26] = 'b011101;		dataTemp[25:21] = 'h7;	dataTemp[20:16] = 'h3;		dataTemp[15:0] = 16'b1111111111111100;		addrIn = 'hC;
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;


	#40 go_contr = 1'b1;
	#6600 go_contr = 1'b0;

	#200 $stop;
  end  


endmodule