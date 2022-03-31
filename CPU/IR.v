module IR(irInput, irOutput, clk, reset);

parameter WIDTH = 32;

	input wire [WIDTH-1:0] irInput;
	output reg [WIDTH-1:0] irOutput;
	input clk, reset;

	
assign enable = 'b1;

register32 ir(irInput, irOutput, clk, reset, enable);
		
endmodule
