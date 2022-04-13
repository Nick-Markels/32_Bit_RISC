//---------------------------------------
// CPU
//
// Authors: Jude Gabriel, Nick Markels
//---------------------------------------


module CPU(addrIn, dataTemp, wrIn, clk, reset, go_contr);

parameter WIDTH = 32;
parameter AWIDTH = 6;


// I/O params
//Controller Inputs
wire [WIDTH-1:0] irOut;      //Data from the IR
wire compOut;		     //Comparator flag

//Controller Outputs
wire pcFetch;		     //Tells the Data Path to populate MAR with PC data
wire pcEn;                  //Enables the PC to grab new location in memory
wire irEn;		     //Enables the IR to recieve data
wire marEn;	             //Enables the MAR to recieve data
wire ldEn;                  //Allows MDR to recieve data from RAM
wire stEn;		     //Allows MDR to recieve data from Register File
wire mdrEn;                 //Allows MDR to recieve any data
wire rd; 	             //CPU read signal
wire wr;		     //CPU wr signal
wire wEn;                   //Enables Register File to write to registers
wire pcIncSel;              //Tells the PC wether to load with internal or external data
wire pcAddSel;		    //Tells teh PC to add 4 or signExtLiteral
wire pcRegSel;              //Chooses either Reg A or Reg C to load PC with

//Inputs into system
input clk;                   //Clock signal for CPU
input reset;	             //Reset for CPU
input go_contr;	             //Tells CPU to start

//Connections between data path and RAM
wire [WIDTH-1:0] dataRAM;  //RAM MAR data bus
wire [WIDTH-1:0] addrRAM; //Address to send to RAM from MAR


//------------------ ADDITIONAL IO TO PREPOPULATE RAM -------------------//
input [WIDTH-1:0] addrIn;      //Input to populate RAM addresses
wire [WIDTH-1:0] addrOut;      //Connection to RAM
input [WIDTH-1:0] dataTemp;    //Temp data to populate RAM
input wrIn;		       //Enable writing to RAM for prepopulation
wire wrContr;                  //Write signal from controller 

mux2to1 wrRamMux(wrContr, wrIn, wrIn, wr);  //Write signal for RAM
bufif32 ramDataBuff(dataRAM, dataTemp, wrIn);           //Data to send in RAM
mux2_to_1 ramAddrMux(addrRAM, addrIn, addrOut, wrIn);

//------------- CONTROLLER ----------//
controller controller(marEn, pcFetch, pcEn, pcIncSel, pcAddSel, pcRegSel, wEn, irEn, ldEn, stEn, mdrEn, compOut, wrContr, rd, clk, reset, irOut, go_contr);


//------------ DATA PATH -------------//
DataPath datapath(compOut, addrOut, irOut, pcFetch, pcEn, pcIncSel, pcAddSel, pcRegSel, irEn, marEn, ldEn, stEn, mdrEn, dataRAM, wrContr, wEn, clk, reset);

//------------- RAM -------------//
RAM ram(dataRAM, rd, wr, addrRAM, clk);


endmodule