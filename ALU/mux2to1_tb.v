`timescale 1ns /1ns

module mux2to1_tb;

reg       A, B;
reg		S;
wire      Out;

// full_Adder full_Adder1(c_out, Sum, A, B, c_in);
mux2to1 mux2to11(Out, S, A, B);
 
initial// Test stimulus
  begin


        #10 S =  0; A = 0; B =  0; 
	#10 S =  0; A = 0; B =  1;
        #10 S =  0; A = 1; B =  0;  
        #10 S =  0; A = 1; B =  1; 
	#10 S =  1; A = 0; B =  0; 
        #10 S =  1; A = 0; B =  1; 
        #10 S =  1; A = 1; B =  0; 
        #10 S =  1; A = 1; B =  1; 
	       
	    
    #10 $stop;
  end
 
initial
   begin
    $display("      time A  B  S Out ");
    $monitor($stime,, A,,, B,,, S,,, Out);
   end

endmodule  