`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 11:14:41 PM
// Design Name: 
// Module Name: err_chk_sim
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


module err_chk_sim();
 logic sA, sB, sR, sSel, sERR;
 //Unit under test is Module: Problem1Schematic
 ERROR_CHK UUT (.A(sA), .B(sB), .R(sR), .SEL(sSel), .ERR(sERR));

 initial begin
   sA = 1; sB = 1; sR = 0; sSel = 0; #10;
   sA = 0; sB = 0; sR = 1; sSel = 0; #10;
   sA = 1; sB = 0; sR = 0; sSel = 1; #10;
   sA = 0; sB = 1; sR = 1; sSel = 1; #10;
   sA = 0; sB = 1; sR = 0; sSel = 1; #10;
   sA = 1; sB = 1; sR = 1; sSel = 0;
 end
endmodule
