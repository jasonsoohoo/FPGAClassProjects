`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 08:02:00 PM
// Design Name: 
// Module Name: FourToOneMux
//////////////////////////////////////////////////////////////////////////////////


module FourToOneMux(
    input A,
    input B,
    input C,
    input D,
    input [1:0] SEL,
    output O
    );
    
    logic res1, res2;
    
    TwoToOneMux mux1 (.A(A), .B(C), .SEL(SEL[1]), .RES(res1));
    TwoToOneMux mux2 (.A(B), .B(D), .SEL(SEL[1]), .RES(res2));   
    TwoToOneMux mux3 (.A(res1), .B(res2), .SEL(SEL[0]), .RES(O));
    
endmodule
