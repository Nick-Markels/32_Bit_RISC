module mux2to1(
    input D0,
    input D1,
    input S,      
    output F

    );

bufif1 buff1 (F, D1, S);   
bufif0 buff2 (F, D0, S);



endmodule