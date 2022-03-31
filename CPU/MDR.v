module MDR(mdrInput, mdrOutput, clk, reset, enable);

parameter WIDTH = 32;

	input wire [WIDTH-1:0] mdrInput;
	output reg [WIDTH-1:0] mdrOutput;
	input clk, reset, enable;

	

register32 mdr(mdrInput, mdrOutput, clk, reset, enable);


		
endmodule
