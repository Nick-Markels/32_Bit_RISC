
`timescale 1ns/1ns

module shift_right_sign_extension_tb_2;

integer a;
integer b;
integer z;

shift_right_sign_extension srse2(z, a, b);

initial 
  begin
	#10 a = 22; b = 1;
	#10 a = -22; b = 1;

	
	
	#10 $stop;
  end

initial 
  begin 
	$display("    time  a   b	z");
	$monitor($time,, a,, b,,,,,, z);
  end

endmodule
