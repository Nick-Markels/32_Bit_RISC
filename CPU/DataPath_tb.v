//------------------------------------------
// CPU Data Path Testbench
//
// Authors: Nick Markels, Jude Gabriel
//------------------------------------------

`timescale 1ns / 1ns


module DataPath_tb;

parameter WIDTH = 32;

	reg [WIDTH-1:0] dataInput;
	reg [WIDTH-1:0] irInput;
	reg registerFileSelect;
	reg wEn;
	reg clk;
	
	
 DataPath data1(irInput, dataInput, wEn, clk, registerFileSelect);


initial
    begin
        clk = 0;
        forever #5 clk = !clk;
    end
	
	
initial
	begin
	
	// --------- WRITE DATA TO REGISTERS ----------
	//Write 4 to R4
	#10 wEn = 1'b1; 	registerFileSelect = 1'b1; 	dataInput = 32'h0000004; 	irInput[25:21] = 'b00100;
	#10 wEn = 1'b0;


	//Write 7 to R7
	#40 wEn = 1'b1;		dataInput = 32'h0000007;	irInput[25:21] = 'b00111;
	#10 wEn = 1'b0;

	//Write 1 to R1
	#40 wEn = 1'b1;		dataInput = 32'h0000001;	irInput[25:21] = 'b00001;
	#10 wEn = 1'b0;

	//Write 3 to R3
	#40 wEn = 1'b1;		dataInput = 32'h0000003;	irInput[25:21] = 'b00011;
	#10 wEn = 1'b0;	

	//Write 2 to R2
	#40 wEn = 1'b1;		dataInput = 32'h0000002;	irInput[25:21] = 'b00010;
	#10 wEn = 1'b0;

	//Write 8 to R8
	#40 wEn = 1'b1;		dataInput = 32'h0000008;	irInput[25:21] = 'b01000;
	#10 wEn = 1'b0;

	//Write 9 to R9
	#40 wEn = 1'b1;		dataInput = 32'h0000009;	irInput[25:21] = 'b01001;
	#10 wEn = 1'b0;

	//Write 16 to R16
	#40 wEn = 1'b1;		dataInput = 32'h80000000;	irInput[25:21] = 'b10000;
	#10 wEn = 1'b0;



	// --------------- USE IR INSTRUCTIONS TO WRITE DATA ------------
	//Set to read data line from ALU
	#40 registerFileSelect = 'b0;
	
	//OP(Ra, Rb, Rc)
	//Add R4 and R7, Store in R11 (Add 4 + 7, store 11)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b0000;		irInput[20:16] = 'b00100; 	irInput[15:11] = 'b00111;	irInput[25:21] = 'b1011;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//Subtract R2 and R1, Store in R12 (Subtract 2 - 1, store 1)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b0001;		irInput[20:16] = 'b00010; 	irInput[15:11] = 'b00001;	irInput[25:21] = 'b1100;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//AND R3 and R1, Store in R13 (AND 11 and 1, store 01)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1000;		irInput[20:16] = 'b00011; 	irInput[15:11] = 'b00001;	irInput[25:21] = 'b1101;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//OR R3 and R8, Store in R14 (OR 11 and 1000, store 1011)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1001;		irInput[20:16] = 'b00011; 	irInput[15:11] = 'b01000;	irInput[25:21] = 'b1110;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//XOR R9 and R7, Store in R15 (XOR 1001 and 0111, store 1110)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1010;		irInput[20:16] = 'b01001; 	irInput[15:11] = 'b00111;	irInput[25:21] = 'b1111;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//XNOR R9 and R7, Store in R17 (XNOR 1001 and 0111, store 0001)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1011;		irInput[20:16] = 'b01001; 	irInput[15:11] = 'b00111;	irInput[25:21] = 'b10001;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SHL R2 and R1, Store in R18 (Shift 10 by 1, store 100)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1100;		irInput[20:16] = 'b00010; 	irInput[15:11] = 'b00001;	irInput[25:21] = 'b10010;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SHR R2 and R1, Store in R19 (Shift 10 by 1, store 01)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1101;		irInput[20:16] = 'b00010; 	irInput[15:11] = 'b00001;	irInput[25:21] = 'b10011;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SRA R16 and R1, Store in R20 (Shift 10000 by 1, store 11000)
	#40 irInput[30] = 'b0;	irInput[29:26] = 'b1110;		irInput[20:16] = 'b10000; 	irInput[15:11] = 'b00001;	irInput[25:21] = 'b10100;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;




	//OP(Ra, literal, RC)
	//Add R4 and 01, Store in R21 (Add 4 + 1, store 5)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b0000;		irInput[20:16] = 'b00100; 	irInput[15:0] = 'b01;	irInput[25:21] = 'b10101;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//Subtract R2 and 1, Store in R22 (Subtract 2 - 1, store 1)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b0001;		irInput[20:16] = 'b00010; 	irInput[15:0] = 'b01;	irInput[25:21] = 'b10110;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//AND R3 and 01, Store in R23 (AND 11 and 1, store 01)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1000;		irInput[20:16] = 'b00011; 	irInput[15:0] = 'b00001;	irInput[25:21] = 'b10111;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//OR R3 and 1000, Store in R24 (OR 11 and 1000, store 1011)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1001;		irInput[20:16] = 'b00011; 	irInput[15:0] = 'b01000;	irInput[25:21] = 'b11000;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//XOR R9 and 0111, Store in R25 (XOR 1001 and 0111, store 1110)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1010;		irInput[20:16] = 'b01001; 	irInput[15:0] = 'b00111;	irInput[25:21] = 'b11001;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//XNOR R9 and R7, Store in R26 (XNOR 1001 and 0100, store 0001)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1011;		irInput[20:16] = 'b01001; 	irInput[15:0] = 'b00111;	irInput[25:21] = 'b11010;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SHL R2 and 01, Store in R27 (Shift 10 by 1, store 100)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1100;		irInput[20:16] = 'b00010; 	irInput[15:0] = 'b00001;	irInput[25:21] = 'b11011;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SHR R2 and 01, Store in R28 (Shift 10 by 1, store 01)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1101;		irInput[20:16] = 'b00010; 	irInput[15:0] = 'b00001;	irInput[25:21] = 'b11100;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//SRA R16 and 01, Store in R29 (Shift 10000 by 1, store 11000)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b1110;		irInput[20:16] = 'b10000; 	irInput[15:0] = 'b00001;	irInput[25:21] = 'b11101;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//Additional Sign Extension Testing
	//Add R4 and FF00, Store in R30 (Should Give FFFFFF04)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b0000;		irInput[20:16] = 'b00100; 	irInput[15:0] = 'hFF00;		irInput[25:21] = 'b11110;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

	//Store 32-bit max in R31
	#40 wEn = 1'b1;		registerFileSelect = 1'b1;	dataInput = 32'hFFFFFFFF;		irInput[25:21] = 'b11111;
	#40 wEn = 1'b0; 	registerFileSelect = 1'b0;

	//Subtract FFFF from R31 store in R29 (Should give 255)
	#40 irInput[30] = 'b1;	irInput[29:26] = 'b0001;		irInput[20:16] = 'b11111; 	irInput[15:0] = 'hFF00;		irInput[25:21] = 'b11101;
	#40 wEn = 1'b1;
	#40 wEn = 1'b0;

    #40 $stop;
  end
 
 initial
   begin
    $display("      time clk dataInput irInput registerFileSelect");
    $monitor($stime,, clk,,, dataInput,,, irInput,,, registerFileSelect);
   end

endmodule  