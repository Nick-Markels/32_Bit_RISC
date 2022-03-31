module MDR(mdrInput, mdrOutput, clk, reset);

parameter WIDTH = 32;

	input wire [WIDTH-1:0] mdrInput;
	output reg [WIDTH-1:0] mdrOutput;
	input clk, reset;

	
assign enable = 'b1;

register32 mdr(mdrInput, mdrOutput, clk, reset, enable);


		
endmodule