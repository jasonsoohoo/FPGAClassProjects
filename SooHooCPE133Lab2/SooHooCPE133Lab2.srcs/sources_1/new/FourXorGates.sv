`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: FourXorGates
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: (XOR) Gates 4 in parallel to process 4 bit input
//////////////////////////////////////////////////////////////////////////////////


module FourXorGates(
    input [3:0] A,
    input [3:0] B,
    output [3:0] O
    );
    
    xor(O[0], A[0], B[0]);
    xor(O[1], A[1], B[1]);
    xor(O[2], A[2], B[2]);
    xor(O[3], A[3], B[3]);
endmodule
