`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/07/2021 03:02:54 AM
// Design Name: 
// Module Name: RCA_4B
//////////////////////////////////////////////////////////////////////////////////


module RCA_4B(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
    );
    
    logic c1, c2, c3;
    
    RCA_1B FA_1 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(c1)); 
    RCA_1B FA_2 (.A(A[1]), .B(B[1]), .Cin(c1), .S(S[1]), .Cout(c2)); 
    RCA_1B FA_3 (.A(A[2]), .B(B[2]), .Cin(c2), .S(S[2]), .Cout(c3)); 
    RCA_1B FA_4 (.A(A[3]), .B(B[3]), .Cin(c3), .S(S[3]), .Cout(Cout)); 
    
endmodule
