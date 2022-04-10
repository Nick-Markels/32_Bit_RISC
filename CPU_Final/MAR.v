module MAR(marInput, marOutput, clk, enable, reset);

parameter WIDTH = 32;

	input wire [WIDTH-1:0] marInput;
	output reg [WIDTH-1:0] marOutput;
	input clk, reset, enable;

	

register32 mar(marInput, marOutput, clk, reset, enable);


		
endmodule