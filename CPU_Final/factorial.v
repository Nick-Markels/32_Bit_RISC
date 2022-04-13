//---------------------------
// Factorial
//
// Author: Jude Gabriel
//---------------------------

`timescale 1ns / 1ns

module factorial_tb;

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
	
	//-------------- LOAD PHASE -----------//

	//Add R31 and 1, store in R0
	#20 dataTemp[31:26] = 'b110000;		dataTemp[25:21] = 'h0; 	dataTemp[20:16] = 'h31; 		dataTemp[15:0] = 'h1;  		 addrIn = 'h0;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;


	//Multiply R0 (1) by 512 decimal, store in R1
	#20 dataTemp[31:26] = 'b110010;		dataTemp[25:21] = 'h1; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'hA;  		 addrIn = 'h4;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Multiply R0 (1) by 255 decimal, store in R3
	#20 dataTemp[31:26] = 'b110010;		dataTemp[25:21] = 'h3; 	dataTemp[20:16] = 'h0; 		dataTemp[15:0] = 'hFF;  		 addrIn = 'h8;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//----------- LOOP PHASE ----------//
	
	//Multiply R1 X R0, store in R0;
	#20 dataTemp[31:26] = 'b100010;		dataTemp[25:21] = 'h0; 	dataTemp[20:16] = 'h0; 		dataTemp[15:11] = 'h1;  		 addrIn = 'hC;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Subtract 1 from R1, store in R1
	#20 dataTemp[31:26] = 'b110001;		dataTemp[25:21] = 'h1; 	dataTemp[20:16] = 'h1; 		dataTemp[15:0] = 'h1;  		 addrIn = 'h10;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;


	//Branching statement: 
	#20 dataTemp[31:26] = 'b011101;		dataTemp[25:21] = 'h31; 	dataTemp[20:16] = 'h1; 		dataTemp[15:0] = 16'b1111111111110100;  		 addrIn = 'h14;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;

	//Store R0 into Ram slot 516 (from R3)
	#20 dataTemp[31:26] = 'b011001;		dataTemp[25:21] = 'h0; 	dataTemp[20:16] = 'h3; 		dataTemp[15:0] = 'h0;   	addrIn = 'h18;  
	#20 wrIn = 'b1;
	#20 wrIn = 'b0;


	#40 go_contr = 1'b1;
	#16600 go_contr = 1'b0;


	end
endmodule