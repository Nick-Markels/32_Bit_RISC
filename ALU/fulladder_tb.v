`timescale 1ns /1ns

module fulladder_tb;

reg       A, B;
reg       c_in;
wire      Sum;
wire      c_out;

// full_Adder full_Adder1(c_out, Sum, A, B, c_in);
fulladder fulladder1 (c_out, Sum, A, B, c_in);
 
 
initial// Test stimulus
  begin
    #10  A = 0; B =  0; c_in = 0;
    #10  A = 0; B =  0; c_in = 1;
    #10  A = 0; B =  1; c_in = 0;
    #10  A = 0; B =  1; c_in = 1;
    #10  A = 1; B =  0; c_in = 0;
    #10  A = 1; B =  0; c_in = 1;
    #10  A = 1; B =  1; c_in = 0;
    #10  A = 1; B =  1; c_in = 1;
    #10 $stop;
  end
 
initial
   begin
    $display("      time A  B  c_in c_out Sum ");
    $monitor($stime,, A,,, B,,, c_in,,,,,, c_out,,,,,, Sum);
   end

endmodule  