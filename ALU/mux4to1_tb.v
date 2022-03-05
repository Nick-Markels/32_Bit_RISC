`timescale 1ns /1ns

module mux4to1_tb;

reg       A, B, C, D;
reg		  S1, S0;
wire      Out;

// full_Adder full_Adder1(c_out, Sum, A, B, c_in);
mux4to1 mux4to11(Out, S1, S0, A, B, C, D);
 
initial// Test stimulus
  begin
        #10  A = 1; B =  0; C = 0; D = 0; S1 =  0; S0 = 0;
        #10  A = 0; B =  0; C = 0; D = 0; S1 =  0; S0 = 1;
        #10  A = 0; B =  1; C = 0; D = 0; S1 =  0; S0 = 1;
        #10  A = 0; B =  0; C = 1; D = 1; S1 =  1; S0 = 0;
        #10  A = 0; B =  0; C = 0; D = 0; S1 =  1; S0 = 1;
        #10  A = 0; B =  0; C = 0; D = 1; S1 =  1; S0 = 1;
	#10  A = 0; B =  0; C = 1; D = 1; S1 =  1; S0 = 0;

	    
    #10 $stop;
  end
 
initial
   begin
    $display("      time A  B C D S1 S0 Out ");
    $monitor($stime,, A,,, B,,, C,,, D,,, S1,,, S0,,, Out);
   end

endmodule  