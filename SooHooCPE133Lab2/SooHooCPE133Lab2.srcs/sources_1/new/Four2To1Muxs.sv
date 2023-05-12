`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: Four2To1Muxs
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: (2:1 MUX) 4 in parallel to process 4 bit input
//////////////////////////////////////////////////////////////////////////////////


module Four2To1Muxs(
    input [3:0] A,
    input [3:0] B,
    input SEL,
    output [3:0] RES
    );
    
    TwoToOneMux mux0 (.A(A[0]), .B(B[0]), .SEL(SEL), .RES(RES[0]));
    TwoToOneMux mux1 (.A(A[1]), .B(B[1]), .SEL(SEL), .RES(RES[1]));
    TwoToOneMux mux2 (.A(A[2]), .B(B[2]), .SEL(SEL), .RES(RES[2]));
    TwoToOneMux mux3 (.A(A[3]), .B(B[3]), .SEL(SEL), .RES(RES[3]));
endmodule
