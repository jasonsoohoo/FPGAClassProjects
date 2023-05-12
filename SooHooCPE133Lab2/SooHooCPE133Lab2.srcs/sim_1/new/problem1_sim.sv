`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: problem1_sim
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: Simulates Problm1MuxCircuit
//////////////////////////////////////////////////////////////////////////////////



module problem1_sim();
 logic [3:0] sA, sB, sResult;
 logic [1:0] sSel;
 //Unit under test is Module: Problem1Schematic
 Problem1MuxCircuit UUT ( .A(sA), .B(sB), .SEL(sSel), .RESULT(sResult));

 initial begin
   sA = 4'b0000; sB = 4'b0000; sSel = 2'b00; #10;
   sA = 4'b0000; sB = 4'b0000; sSel = 2'b10; #10;
   sA = 4'b0000; sB = 4'b0000; sSel = 2'b01; #10;
   sA = 4'b0000; sB = 4'b0000; sSel = 2'b11; #10;
   sA = 4'b1111; sB = 4'b0000; sSel = 2'b00; #10;
   sA = 4'b1111; sB = 4'b1111; sSel = 2'b10; #10;
   sA = 4'b0011; sB = 4'b0101; sSel = 2'b01;
 end
endmodule
