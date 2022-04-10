`timescale 1ns /1ns

module decoder5to32_tb;


reg [4:0] I;

reg En;

wire Y31, Y30, Y29, Y28, Y27, Y26, Y25, Y24, Y23, Y22, Y21, Y20, Y19, Y18, Y17, Y16, Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

decoder5to32 decoder(Y31, Y30, Y29, Y28, Y27, Y26, Y25, Y24, Y23, Y22, Y21, Y20, Y19, Y18, Y17, Y16, Y15, Y14, Y13, Y12, Y11, Y10, Y9, Y8, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, I, En);

initial 
 begin
		#10 En = 1'b1; I = 'h0;
		#10 En = 1'b1; I = 'h1;
		#10 En = 1'b1; I = 'h2;
		#10 En = 1'b1; I = 'h3;
		#10 En = 1'b1; I = 'h4;
		#10 En = 1'b1; I = 'h5;
		#10 En = 1'b1; I = 'h6;
		#10 En = 1'b1; I = 'h7;
		#10 En = 1'b1; I = 'h8;
		#10 En = 1'b1; I = 'h9;
		#10 En = 1'b1; I = 'hA;
		#10 En = 1'b1; I = 'hB;
		#10 En = 1'b1; I = 'hC;
		#10 En = 1'b1; I = 'hD;
		#10 En = 1'b1; I = 'hE;
		#10 En = 1'b1; I = 'hF;
		#10 En = 1'b1; I = 'h10;
		#10 En = 1'b1; I = 'h11;
		#10 En = 1'b1; I = 'h12;
		#10 En = 1'b1; I = 'h13;
		#10 En = 1'b1; I = 'h14;
		#10 En = 1'b1; I = 'h15;
		#10 En = 1'b1; I = 'h16;
		#10 En = 1'b1; I = 'h17;
		#10 En = 1'b1; I = 'h18;
		#10 En = 1'b1; I = 'h19;
		#10 En = 1'b1; I = 'h1A;
		#10 En = 1'b1; I = 'h1B;
		#10 En = 1'b1; I = 'h1C;
		#10 En = 1'b1; I = 'h1D;
		#10 En = 1'b1; I = 'h1E;
		#10 En = 1'b1; I = 'h1F;
		
        
		
	#10 $stop;
  end
  
    initial
   begin
    $display("      time I En Y31 Y30 Y29 Y28 Y27 Y26 Y25 Y24 Y23 Y22 Y21 Y20 Y19 Y18 Y17 Y16 Y15 Y14 Y13 Y12 Y11 Y10 Y9 Y8 Y7 Y6 Y5 Y4 Y3 Y2 Y1 Y0");
    $monitor($stime,,I,,, En,,, Y31,,, Y30,,, Y29,,, Y28,,, Y27,,, Y26,,, Y25,,, Y24,,, Y23,,, Y22,,, Y21,,, Y20,,, Y19,,, Y18,,, Y17,,, Y16,,, Y15,,, Y14,,, Y13,,, Y12,,, Y11,,, Y10,,, Y9,,, Y8,,, Y7,,, Y6,,, Y5,,, Y4,,, Y3,,, Y2,,, Y1,,, Y0);
   end

endmodule  