`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2021 10:20:05 PM
// Design Name: 
// Module Name: Problem3Sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Problem3Sim();
//Creation of signals
 logic sA, sB, sC, sD, sX, sY;
 //Unit under test is Module: Problem1Schematic
 Problem3MinimalTruthTables UUT ( .A(sA), .B(sB), .C(sC), .D(sD), .X(sX), .Y(sY));

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