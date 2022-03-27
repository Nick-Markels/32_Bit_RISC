module IR(irInput, irOutput, clk, reset);

parameter WIDTH = 32;

	input wire [WIDTH-1:0] irInput;
	output reg [WIDTH-1:0] irOutput;
	input clk, reset;
	
always @(negedge reset or posedge clk)

	if (~reset)
	
		assign irOutput = 'h00000000;
		
	else
		assign irOutput = irInput;
		
endmodule