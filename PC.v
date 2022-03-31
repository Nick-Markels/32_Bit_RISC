module PC(pcOutput, clk, reset, enable);

parameter WIDTH = 32;

	
	output reg [WIDTH-1:0] pcOutput;
	input clk, reset, enable;
	wire cout;
	wire [WIDTH-1:0] A;
	
	reg [WIDTH-1:0] Sum;
	

assign A = 32'h4;

cla_adder32 add(cout, Sum, A, pcOutput);

register32 pc(Sum, pcOutput, clk, reset, enable);


		
endmodule