

module adder32(Carry, Sum, A, B);  

parameter WIDTH = 32;

output     [WIDTH-1:0]  Sum;
output  		        Carry;
input  	   [WIDTH-1:0]  A, B;

wire   [WIDTH-1:0]  cin;


  assign cin[0] = 1'b0;

fulladder adder31 (Carry, Sum[31], A[31], B[31], cin[31]);
fulladder adder30 (cin[31], Sum[30], A[30], B[30], cin[30]);
fulladder adder29 (cin[30], Sum[29], A[29], B[29], cin[29]);
fulladder adder28 (cin[29], Sum[28], A[28], B[28], cin[28]);
fulladder adder27 (cin[28], Sum[27], A[27], B[27], cin[27]);
fulladder adder26 (cin[27], Sum[26], A[26], B[26], cin[26]);
fulladder adder25 (cin[26], Sum[25], A[25], B[25], cin[25]);
fulladder adder24 (cin[25], Sum[24], A[24], B[24], cin[24]);
fulladder adder23 (cin[24], Sum[23], A[23], B[23], cin[23]);
fulladder adder22 (cin[23], Sum[22], A[22], B[22], cin[22]);
fulladder adder21 (cin[22], Sum[21], A[21], B[21], cin[21]);
fulladder adder20 (cin[21], Sum[20], A[20], B[20], cin[20]);
fulladder adder19 (cin[20], Sum[19], A[19], B[19], cin[19]);
fulladder adder18 (cin[19], Sum[18], A[18], B[18], cin[18]);
fulladder adder17 (cin[18], Sum[17], A[17], B[17], cin[17]);
fulladder adder16 (cin[17], Sum[16], A[16], B[16], cin[16]);
fulladder adder15 (cin[16], Sum[15], A[15], B[15], cin[15]);
fulladder adder14 (cin[15], Sum[14], A[14], B[14], cin[14]);
fulladder adder13 (cin[14], Sum[13], A[13], B[13], cin[13]);
fulladder adder12 (cin[13], Sum[12], A[12], B[12], cin[12]);
fulladder adder11 (cin[12], Sum[11], A[11], B[11], cin[11]);
fulladder adder10 (cin[11], Sum[10], A[10], B[10], cin[10]);
fulladder adder9 (cin[10], Sum[9], A[9], B[9], cin[9]);
fulladder adder8 (cin[9], Sum[8], A[8], B[8], cin[8]);
fulladder adder7 (cin[8], Sum[7], A[7], B[7], cin[7]);
fulladder adder6 (cin[7], Sum[6], A[6], B[6], cin[6]);
fulladder adder5 (cin[6], Sum[5], A[5], B[5], cin[5]);
fulladder adder4 (cin[5], Sum[4], A[4], B[4], cin[4]);
fulladder adder3 (cin[4], Sum[3], A[3], B[3], cin[3]);
fulladder adder2 (cin[3], Sum[2], A[2], B[2], cin[2]);
fulladder adder1 (cin[2], Sum[1], A[1], B[1], cin[1]);
fulladder adder0 (cin[1], Sum[0], A[0], B[0], cin[0]);


endmodule 

