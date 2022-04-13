// -----------------------------------------------------------
//	Module:		32-Bit Comparator
//	Author:		Jude Gabriel
//	Contact:	gabriel23@up.edu
//	Date:		April 12, 2022
// ----------------------------------------------------------

module comparator(z, a, b);

input  [31:0] a;
input  [31:0] b;
output reg  z;


always @(*)
  begin 
	if(a == b)
		assign z = 1;
	else 
		assign z = 0;
  end

endmodule