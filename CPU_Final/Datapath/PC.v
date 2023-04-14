module PC(pcOutput, pcIn, pcSel, literal, pcAddSel, clk, reset, enable);

parameter WIDTH = 32;

	
	output reg [WIDTH-1:0] pcOutput;
	input clk, reset, enable;
	input [WIDTH-1:0] pcIn;   //Outside input to store in PC
	input pcSel;		 //Selects either into adder value into pc or outside value
	input [WIDTH-1:0] literal; //Sign extended literal to store in pc
	input pcAddSel;			//Chooses to add 4 to PC value or SEXT
	wire cout;
	wire [WIDTH-1:0] A;
	
	wire [WIDTH-1:0] muxOut; //Output from MUX into pc
	wire [WIDTH-1:0] addIn;  //Input to the adder
	
	reg [WIDTH-1:0] Sum;
	

assign A = 32'h4;


mux2_to_1 muxInPC(muxOut, pcIn, Sum, pcSel);  //Choose to load PC externally or Internally

mux2_to_1 muxInAdder(addIn, literal, A, pcAddSel);

register32 pc(muxOut, pcOutput, clk, reset, enable);   //PC

cla_adder32 add(cout, Sum, addIn, pcOutput);  //Adder


		
endmodule