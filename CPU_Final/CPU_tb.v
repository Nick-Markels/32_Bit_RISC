//---------------------------------------
// CPU Testbench
//
// Authors: Jude Gabriel, Nick Markels
//---------------------------------------


`timescale 1ns/1ns

module CPU_tb;

//Parameters for bus sizes
parameter DWIDTH = 32;
parameter AWIDTH = 6;

// I/O
wire [DWIDTH-1:0] irOut;      //Output containing IR contents
reg pcFetch;                  //Enable the MAR to recieve PC data
reg pcEn;                     //Enable the PC to update address
reg irEn;		      //Enable IR to recieve data
reg marEn;  	    	      //Enable the MAR to recieve data
reg ldEn;		      //Enable MDR to get loaded with RAM data
reg stEn;		      //Enable MDR to store Register File data
reg mdrEn;		      //Enable the MDR
reg [DWIDTH-1:0] irInput;     //Populates IR with initial data
reg [DWIDTH-1:0] dataInput;   //Inital data to populate registers
reg rd;                       //CPU read signal
reg wr;                       //CPU write signal
reg wEn;                      //Enables the register file
reg clk;                      //Clock signal for CPU
reg registerFileSelect;       //Select line for choosing between ALU/MDR data and dataInput
reg reset;                    //Reset for CPU



//----------- INSTANTIATE CPU -------------//
CPU cpu(irOut, pcFetch, pcEn, irEn, marEn, ldEn, stEn, mdrEn,irInput, dataInput, rd, wr, wEn, clk, reset, registerFileSelect);


//----------- SEND CLOCK HIGH AND LOW ----------//
initial
    begin
        clk = 0;
        forever #10 clk = !clk;
    end


initial
	begin
	
	// --------- WRITE DATA TO REGISTERS USING IRINPUT ----------//

	//Turn off PC since we are only populating data from Register File, Turn on IR
	#0 pcFetch = 1'b0;	pcEn = 1'b0;		irEn = 1'b1; 	reset = 1'b0;

	//Write 4 to R4
	#10 registerFileSelect = 1'b1; 	irInput[25:21] = 'b00100;	dataInput = 32'h0000004; reset = 1'b1;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;


	//Write 7 to R7
	#30 irInput[25:21] = 'b00111;	dataInput = 32'h0000007;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write 1 to R1
	#30 irInput[25:21] = 'b00001;	dataInput = 32'h0000001;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write 3 to R3
	#30 irInput[25:21] = 'b00011;	dataInput = 32'h0000003;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;	

	//Write 2 to R2
	#30 irInput[25:21] = 'b00010;	dataInput = 32'h0000002;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write 8 to R8
	#30 irInput[25:21] = 'b01000;	dataInput = 32'h0000008;
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write 9 to R9
	#30 irInput[25:21] = 'b01001;	dataInput = 32'h0000009;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write 16 to R16
	#30 irInput[25:21] = 'b10000;	dataInput = 32'h80000000;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;
	
	//Write 0 to R0
	#30 irInput[25:21] = 'b00000;	dataInput = 32'h00000000;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;


	// ------------- STORE DATA FROM REGISTER FILE IN RAM --------------- //

	//Store R1 (1) in RAM slot 0 (From R0)
	#30 registerFileSelect = 1'b0;		irEn = 1'b1;	 marEn = 1'b1; irInput[31] = 'b0;		irInput[25:21] =  'b00001;	irInput[20:16] = 'b00000; 
						stEn = 1'b1;	 mdrEn = 1'b1;		ldEn = 1'b0;
	#20 rd = 'b0; 		wr = 1'b1; 
	#30 rd = 'b0;		wr = 'b0;

	//Store R16 (1) in RAM slot 1 (From R4)
	#10 irInput[31] = 'b0;		irInput[25:21] =  'b10000;	irInput[20:16] = 'b00100;
	#20 rd = 'b0; 		wr = 1'b1; 
	#30 rd = 'b0;		wr = 'b0;

	//Store R3 (1) in RAM slot 2 (From R8)
	#10 irInput[31] = 'b0;		irInput[25:21] =  'b00011;	irInput[20:16] = 'b01000;
	#20 rd = 'b0; 		wr = 1'b1; 
	#30 rd = 'b0;		wr = 'b0; 	stEn = 1'b0; 	mdrEn = 1'b0;


	// --------------- LOAD DATA INTO REGISTER FILE FROM RAM ------------- //

	//Store RAM slot 0 into R31
	#10 irInput[31] = 1'b0; 	irInput[25:21] = 'b11111;	irInput[20:16] = 'b00000;	ldEn = 1'b1; 	mdrEn = 1'b1;
	#20 rd = 'b1;		wr = 'b0;	
	#50 wEn = 1'b1;
	#50 rd = 'b0;		wr = 'b0;	wEn = 1'b0;

	//Store RAM slot 1 into R30
	#10 irInput[25:21] = 'b11110; 	irInput[20:16] = 'b00100;
	#30 rd = 'b1;		wr = 'b0;
	#50 wEn = 1'b1;
	#50 rd = 'b0;		wr = 'b0;	wEn = 1'b0;

	//Store RAM slot 2 into R29
	#10 irInput[25:21] = 'b11101; 	irInput[20:16] = 'b01000;
	#30 rd = 'b1;		wr = 'b0;
	#50 wEn = 1'b1;
	#50 rd = 'b0;		wr = 'b0;	wEn = 1'b0;	ldEn = 1'b0; 	mdrEn = 1'b0;
	


	// ---------------- PROGRAM COUNTER TESTS ------------------//
	
	//Recieve Instruction Stored in RAM slot 0 using PC 
	#20 pcEn = 1'b0;	pcFetch = 1'b1; 	irEn = 1'b0;		//Fetch 'h0 from PC
	#20 rd = 1'b1;								//Allow RAM to Read the Address
	#20 irEn = 1'b1;							//Read into the IR
	#20 irEn = 1'b0;	rd = 1'b0;					//Turn off IR (no more reading)

	//Recieve Instruction Stored in RAM slot 1 using PC
	#40 pcEn = 1'b1;							//Enable PC so it counts up	
	#20 pcEn = 1'b0;							//Turn off PC so it will stop counting				
	#20 pcFetch = 1'b1; 							//Enable fetching PC contents
	#20 rd = 1'b1;								//Enable RAM for reading
	#20 irEn = 1'b1;							//Enable IR for reading
	#20 irEn = 1'b0;	rd = 1'b0;					//Turn off IR for reading

	//Recieve Instruction Stored in RAM slot 2 using PC
	#40 pcEn = 1'b1;							//Enable PC so it counts up	
	#20 pcEn = 1'b0;							//Turn off PC so it will stop counting				
	#20 pcFetch = 1'b1; 							//Enable fetching PC contents
	#20 rd = 1'b1;								//Enable RAM for reading
	#20 irEn = 1'b1;							//Enable IR for reading
	#20 irEn = 1'b0;	rd = 1'b0;					//Turn off IR for reading
	#20 pcFetch = 1'b0; pcEn = 1'b0; rd = 1'b0; reset = 1'b0;		//Turn off all signals to prepare for next test

	

	//-------------- PUTTING IT ALL TOGETHER - WRITE TO REG, LOAD RAM, ST IN MEM, FETCH INSTRUCTION FROM PC ---------------//
	#70 reset = 1'b1; irEn = 1'b1;

	//Write 0 to R0
	#50 registerFileSelect = 1'b1; irInput[25:21] = 'b00000;	dataInput = 32'h00000000;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;
	
	//Write 1 to R1
	#30 registerFileSelect = 1'b1; irInput[25:21] = 'b00001;	dataInput = 'h1;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Write the address of RAM 2 to R2
	#30 registerFileSelect = 1'b1; irInput[25:21] = 'b00010;	dataInput = 'b00100;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Load R4 with an instruction for adding R6 + R7 and storing in R8
	#30 registerFileSelect = 1'b1; 	irInput[25:21] = 'h4;		dataInput[31:26] = 'b100000; 	dataInput[25:21] = 'h8; 	
									dataInput[20:16] = 'h6;	dataInput[15:11] = 'h7;
									dataInput[10:0] = 'h0;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Load R5 with an instruction for subtracting R8 - R7 and storing in R9
	#30 registerFileSelect = 1'b1; 	irInput[25:21] = 'h5;		dataInput[31:26] = 'b100001; 	dataInput[25:21] = 'h9; 	
									dataInput[20:16] = 'h8;	dataInput[15:11] = 'h7;
									dataInput[10:0] = 'h0;	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Load R6 with 6
	#30 registerFileSelect = 1'b1; 	irInput[25:21] = 'h6;	dataInput = 32'h6; 	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;

	//Load R7 with 7
	#30 registerFileSelect = 1'b1; 	irInput[25:21] = 'h7;	dataInput = 32'h7; 	
	#20 wEn = 1'b1;
	#10 wEn = 1'b0;
	

	//Store R4 in RAM slot 0
	#30 registerFileSelect = 1'b0; 		irEn = 1'b1; 		irInput[31] = 'b0;		irInput[25:21] =  'h4;		irInput[20:16] = 'h0;
	#30 stEn = 1'b1; 	mdrEn = 1'b1;
	#30 rd = 'b0; 		wr = 1'b1; 
	#30 rd = 'b0;		wr = 'b0;  stEn = 1'b0; 	mdrEn = 1'b0;

	//Store R5 in RAM slot 1
	#30 registerFileSelect = 1'b0; 		irEn = 1'b1; 		irInput[31] = 'b0;		irInput[25:21] =  'h5;		irInput[20:16] = 'h2;
	#30 stEn = 1'b1; 	mdrEn = 1'b1;
	#30 rd = 'b0; 		wr = 1'b1; 
	#30 rd = 'b0;		wr = 'b0;  stEn = 1'b0; 	mdrEn = 1'b0;


	//Fetch the First operation from RAM slot 0
	#20 pcEn = 1'b0;	pcFetch = 1'b1; 	irEn = 1'b0;		//Fetch 'h0 from PC
	#20 rd = 1'b1;								//Allow RAM to Read the Address
	#20 irEn = 1'b1;							//Read into the IR
	#20 wEn = 1'b1;
	#20 irEn = 1'b0;	rd = 1'b0;		wEn = 1'b0;		//Turn off IR (no more reading)

	//Recieve Instruction Stored in RAM slot 1 using PC
	#40 pcEn = 1'b1;							//Enable PC so it counts up	
	#20 pcEn = 1'b0;							//Turn off PC so it will stop counting				
	#20 pcFetch = 1'b1; 							//Enable fetching PC contents
	#20 rd = 1'b1;								//Enable RAM for reading
	#20 irEn = 1'b1;							//Enable IR for reading
	#20 wEn = 1'b1;
	#20 irEn = 1'b0;	rd = 1'b0;		wEn = 1'b0;		//Turn off IR for reading
	#100 $stop;




   end 



endmodule