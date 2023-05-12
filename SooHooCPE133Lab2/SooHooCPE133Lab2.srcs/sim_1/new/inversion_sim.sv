`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: inversion_sim
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: Simulates FourInvert
//////////////////////////////////////////////////////////////////////////////////


module inversion_sim();
//Creation of signals
 logic [3:0] sA, sResult;
 //Unit under test is Module: Problem1Schematic
 FourInvert UUT ( .A(sA), .O(sResult));

 initial begin

// sA[0] = 0; sA[1] = 0; sA[2] = 0; sA[3] = 0; #10;
// sA[0] = 1; sA[1] = 1; sA[2] = 1; sA[3] = 1; #10;
// sA[0] = 1; sA[1] = 0; sA[2] = 1; sA[3] = 0; #10;
// sA[0] = 0; sA[1] = 1; sA[2] = 0; sA[3] = 1; #10;
// sA[0] = 1; sA[1] = 1; sA[2] = 0; sA[3] = 0; #10;
// sA[0] = 0; sA[1] = 0; sA[2] = 1; sA[3] = 1;
    
   sA = 4'b0000; #10;
   sA = 4'b1111; #10;
   sA = 4'b1010; #10;
   sA = 4'b0101;
 end
endmodule
