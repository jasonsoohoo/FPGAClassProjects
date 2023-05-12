`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/07/2021 03:02:54 AM
// Design Name: 
// Module Name: RCA_1B
//////////////////////////////////////////////////////////////////////////////////


module RCA_1B(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    
    logic xor_ab, and_ab, and_cin_xorab;
    
    xor(xor_ab, A, B);
    and(and_ab, A, B);
    xor(S, xor_ab, Cin);
    and(and_cin_xorab, Cin, xor_ab);
    or(Cout, and_cin_xorab, and_ab);
    
endmodule
