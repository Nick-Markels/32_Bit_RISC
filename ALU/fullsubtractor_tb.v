`timescale 1ns /1ns

module fullsubtractor_tb;

reg       A, B;
reg       Bin;
wire      Diff;
wire      Bout;

// full_Adder full_Adder1(c_out, Sum, A, B, c_in);
fullsubtractor fullsubtractor1(Bout, Diff, A, B, Bin);
 
 
initial// Test stimulus
  begin
    #10  A = 0; B =  0; Bin = 0;
    #10  A = 0; B =  0; Bin = 1;
    #10  A = 0; B =  1; Bin = 0;
    #10  A = 0; B =  1; Bin = 1;
    #10  A = 1; B =  0; Bin = 0;
    #10  A = 1; B =  0; Bin = 1;
    #10  A = 1; B =  1; Bin = 0;
    #10  A = 1; B =  1; Bin = 1;

    #10 $stop;
  end
 
initial
   begin
    $display("      time A  B  Bin Bout Diff ");
    $monitor($stime,, A,,, B,,, Bin,,,,,, Bout,,,,,, Diff);
   end

endmodule  