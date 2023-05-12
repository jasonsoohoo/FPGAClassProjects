`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 10:25:45 PM
// Design Name: 
// Module Name: Problem1Sim
//////////////////////////////////////////////////////////////////////////////////


module Problem1Sim();
//Creation of signals
 logic [3:0] sA, sO;
 logic sDIR, sROT;
 logic [1:0] sS;

 Problem1Shifter UUT ( .A(sA), .DIR(sDIR), .ROT(sROT), .S(sS), .O(sO));

 initial begin
    
   sA = 4'b1001; sDIR = 0; sROT = 0; sS = 2'b00; #10;
   sA = 4'b1001; sDIR = 0; sROT = 0; sS = 2'b01; #10;
   sA = 4'b1001; sDIR = 0; sROT = 0; sS = 2'b10; #10;
   sA = 4'b1001; sDIR = 0; sROT = 0; sS = 2'b11; #10;

   sA = 4'b1001; sDIR = 0; sROT = 1; sS = 2'b10; #10;
   sA = 4'b1001; sDIR = 0; sROT = 1; sS = 2'b11; #10;
         
   sA = 4'b1001; sDIR = 1; sROT = 0; sS = 2'b10; #10;
   sA = 4'b1001; sDIR = 1; sROT = 0; sS = 2'b11; #10;
               
   sA = 4'b1001; sDIR = 1; sROT = 1; sS = 2'b10; #10;
   sA = 4'b1001; sDIR = 1; sROT = 1; sS = 2'b11;
   
 end
endmodule
