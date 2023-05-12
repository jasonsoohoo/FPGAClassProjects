`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: nand_gate_sim
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: Simulates FourAndGates
//////////////////////////////////////////////////////////////////////////////////


module nand_gate_sim();
 logic [3:0] sA, sB, sResult;
 //Unit under test is Module: Problem1Schematic
 FourAndGates UUT ( .A(sA), .B(sB), .O(sResult));

 initial begin
   sA = 4'b0000; sB = 4'b0000; #10;
   sA = 4'b0000; sB = 4'b1111; #10;
   sA = 4'b1111; sB = 4'b0000; #10;
   sA = 4'b1111; sB = 4'b1111; #10;
   sA = 4'b0011; sB = 4'b0101;
 end
endmodule
