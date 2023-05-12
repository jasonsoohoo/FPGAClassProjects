`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 10:08:51 PM
// Design Name: 
// Module Name: RCA_8B
//////////////////////////////////////////////////////////////////////////////////


module RCA_8B(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout
    );
    
    logic c1;
    
    RCA_4B FA_1 (.A(A[7:4]), .B(B[7:4]), .Cin(Cin), .S(S[7:4]), .Cout(c1)); 
    RCA_4B FA_2 (.A(A[3:0]), .B(B[3:0]), .Cin(c1), .S(S[3:0]), .Cout(Cout));
    
endmodule
