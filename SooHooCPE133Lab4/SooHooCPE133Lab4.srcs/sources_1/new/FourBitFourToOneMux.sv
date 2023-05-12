`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Jason SooHoo
// Engineer: Cal Poly 
// 
// Create Date: 02/14/2021 08:35:19 PM
// Design Name: 
// Module Name: FourBitFourToOneMux
//////////////////////////////////////////////////////////////////////////////////


module FourBitFourToOneMux(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] SEL,
    output [3:0] O);
        
    FourToOneMux fourM1 (.A(A[0]), .B(B[0]), .C(C[0]), .D(D[0]), .SEL(SEL), .O(O[0]));
    FourToOneMux fourM2 (.A(A[1]), .B(B[1]), .C(C[1]), .D(D[1]), .SEL(SEL), .O(O[1]));
    FourToOneMux fourM3 (.A(A[2]), .B(B[2]), .C(C[2]), .D(D[2]), .SEL(SEL), .O(O[2]));
    FourToOneMux fourM4 (.A(A[3]), .B(B[3]), .C(C[3]), .D(D[3]), .SEL(SEL), .O(O[3]));
    
endmodule
