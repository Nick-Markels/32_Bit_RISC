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
	#20 dataTemp[31:26] = 'b100000;		dataTemp[25:21] = 'h3; 	dataTemp[20:16] = 'h2; 		dataTemp[15:11] = 'h1; 		dataTemp[10:0] = 'h0; 		 addrIn = 'h0; //Add R1 and R0, store in R3 
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	#20 dataTemp[31:26] = 'b011000;		dataTemp[25:21] = 'h4; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'h0; 	 	 addrIn = 'h4; 	//Load Ram slot 0 into R4
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	#20 dataTemp[31:26] = 'b011001;		dataTemp[25:21] = 'h0; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'h0;   	addrIn = 'h8;  //Store R0 into Ram slot 0 
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;


	#40 go_contr = 1'b1;
	#1900 go_contr = 1'b0;

	//Fetch first operation and update PC
	//#40 go_fetch = 'b1;
	//#130 go_fetch = 'b0;

	//#40 go_pc = 'b1;
	//#60 go_pc = 'b0;

	//Enable the ALU since first operation is ALU op
	//#40 go_dc = 'b1;
	//#160 go_dc = 'b0;

	//Fetch next operation and update PC
	//#30 go_fetch = 'b1;
	//#130 go_fetch = 'b0;

	//#40 go_pc = 'b1;
	//#60 go_pc = 'b0;

	//Enable the load FSM since next op is load
	//#40 go_dc = 1'b1;
	//#280 go_dc = 0'b0;

	//Fetch next operation and update PC
	//#30 go_fetch = 'b1;
	//#130 go_fetch = 'b0;

	//#40 go_pc = 'b1;
	//#60 go_pc = 'b0;

	//Enable the store FSM since next op is store
	//#40 go_dc = 1'b1;
	//#220 go_dc = 1'b0;

	#200 $stop;
  end  


endmodule