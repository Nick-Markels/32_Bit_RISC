`timescale 1ns /1ns

module mux8to1_tb;

reg       A, B, C, D, E, F, G, H;
reg		  S2, S1, S0;
wire      Out;

// full_Adder full_Adder1(c_out, Sum, A, B, c_in);
mux8to1 mux8to10(Out, S2, S1, S0, A, B, C, D, E, F, G, H);
 
initial// Test stimulus
  begin

    #10  A = 1; B =  0; C =  0; D =  0; E =  0; F =  0; G =  0; H =  1; S2 =  0; S1 =  0; S0 =  0;
    #10  A = 0; B =  0; C =  0; D =  0; E =  0; F =  0; G =  0; H =  0; S2 =  0; S1 =  0; S0 =  1;
    #10  A = 0; B =  1; C =  0; D =  0; E =  0; F =  0; G =  0; H =  0; S2 =  0; S1 =  0; S0 =  1;
    #10  A = 0; B =  0; C =  1; D =  0; E =  0; F =  0; G =  0; H =  0; S2 =  0; S1 =  0; S0 =  1;
    #10  A = 0; B =  0; C =  1; D =  1; E =  0; F =  0; G =  0; H =  0; S2 =  0; S1 =  1; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  0; E =  1; F =  0; G =  0; H =  0; S2 =  0; S1 =  0; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  1; E =  0; F =  1; G =  0; H =  0; S2 =  1; S1 =  0; S0 =  0;
    #10  A = 0; B =  0; C =  0; D =  0; E =  0; F =  0; G =  1; H =  0; S2 =  1; S1 =  0; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  0; E =  1; F =  0; G =  0; H =  1; S2 =  1; S1 =  0; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  0; E =  0; F =  0; G =  0; H =  1; S2 =  1; S1 =  1; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  0; E =  0; F =  0; G =  0; H =  1; S2 =  1; S1 =  1; S0 =  1;
    #10  A = 0; B =  0; C =  0; D =  0; E =  0; F =  0; G =  0; H =  1; S2 =  1; S1 =  1; S0 =  1;

   





    #10 $stop;
  end
 
initial
   begin
    $display("      time A  B  c_in c_out Sum ");
    $monitor($stime,, A,,, B,,, C,,, D,,, E,,, F,,, G,,, H,,, S2,,, S1,,, S0,,, Out);
   end

endmodule  