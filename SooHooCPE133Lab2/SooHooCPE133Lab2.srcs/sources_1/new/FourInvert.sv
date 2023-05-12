`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: FourInvert
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: (NOT) Gates 4 in parallel to process 4 bit input
//////////////////////////////////////////////////////////////////////////////////



module FourInvert(
    input [3:0] A,
    output [3:0] O
    );
    not(O[0], A[0]);
    not(O[1], A[1]);
    not(O[2], A[2]);
    not(O[3], A[3]);
endmodule
