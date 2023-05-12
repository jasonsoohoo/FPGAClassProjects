`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/17/2021 09:45:16 PM
// Module Name: Problem1Sim
// Project Name: Lab 0
// Description:  Simulation for Problem 1 - A circuit derived from a schematic.
//////////////////////////////////////////////////////////////////////////////////


module Problem1Sim();
    //Creation of signals
    logic sA, sB, sC, sD, sX, sY, sZ;
    //Unit under test is Module: Problem1Schematic
    Problem1Schematic UUT ( .A(sA), .B(sB), .C(sC), .D(sD), .X(sX), .Y(sY), .Z(sZ) );
    
    initial begin
    
    sA = 0; sB = 0; sC = 0; sD = 0; #10;
    sA = 0; sB = 0; sC = 0; sD = 1; #10;
    sA = 0; sB = 0; sC = 1; sD = 0; #10;
    sA = 0; sB = 0; sC = 1; sD = 1; #10;
    sA = 0; sB = 1; sC = 0; sD = 0; #10;
    sA = 0; sB = 1; sC = 0; sD = 1; #10;
    sA = 0; sB = 1; sC = 1; sD = 0; #10;
    sA = 0; sB = 1; sC = 1; sD = 1; #10;
    sA = 1; sB = 0; sC = 0; sD = 0; #10;
    sA = 1; sB = 0; sC = 0; sD = 1; #10;
    sA = 1; sB = 0; sC = 1; sD = 0; #10;
    sA = 1; sB = 0; sC = 1; sD = 1; #10;
    sA = 1; sB = 1; sC = 0; sD = 0; #10;
    sA = 1; sB = 1; sC = 0; sD = 1; #10;
    sA = 1; sB = 1; sC = 1; sD = 0; #10;
    sA = 1; sB = 1; sC = 1; sD = 1;
    
    end
endmodule
