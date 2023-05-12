`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 11:50:05 PM
// Design Name: 
// Module Name: problem1sim
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


module problem1sim();
 logic [3:0] sA, sB, sS;
 logic sSel, sERR;
 //Unit under test is Module: Problem1Schematic
 Problem1RCA UUT ( .A(sA), .B(sB), .SEL(sSel), .S(sS), .ERR(sERR));

 initial begin
   sA = 4'b0000; sB = 4'b0000; sSel = 0; #10;
   sA = 4'b1001; sB = 4'b1010; sSel = 0; #10;
   sA = 4'b0111; sB = 4'b1010; sSel = 1; #10;
   sA = 4'b1110; sB = 4'b0000; sSel = 0; #10;
   sA = 4'b0100; sB = 4'b0101; sSel = 1;
 end

endmodule
