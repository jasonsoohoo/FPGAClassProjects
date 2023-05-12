`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 08:35:19 PM
// Module Name: Problem1Shifter
//////////////////////////////////////////////////////////////////////////////////


module Problem1Shifter(
    input [3:0] A,
    input DIR,
    input ROT,
    input [1:0] S,
    output [3:0] O
    );
    
    logic [3:0] s1, s2, s3;
    
    FourBitShifter shift1 (.Din(A), .DIR(DIR), .ROT(ROT), .Dout(s1));
    FourBitShifter shift2 (.Din(s1), .DIR(DIR), .ROT(ROT), .Dout(s2));
    FourBitShifter shift3 (.Din(s2), .DIR(DIR), .ROT(ROT), .Dout(s3));
    
    FourBitFourToOneMux selector (.A(A), .B(s1), .C(s2), .D(s3), .SEL(S), .O(O));

endmodule
