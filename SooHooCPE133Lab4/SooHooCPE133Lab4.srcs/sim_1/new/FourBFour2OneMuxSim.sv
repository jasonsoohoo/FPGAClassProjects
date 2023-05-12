`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 10:34:49 PM
// Design Name: 
// Module Name: FourBFour2OneMuxSim
//////////////////////////////////////////////////////////////////////////////////


module FourBFour2OneMuxSim();
//Creation of signals
 logic [3:0] sA, sB, sC, sD, sO;
 logic [1:0] SEL;

 FourBitFourToOneMux UUT ( .A(sA), .B(sB), .C(sC), .D(sD), .SEL(SEL), .O(sO));

 initial begin
    
   sA = 4'b0001; sB = 4'b0010; sC = 4'b0100; sD = 4'b1000; SEL = 2'b00; #10;
   sA = 4'b0001; sB = 4'b0010; sC = 4'b0100; sD = 4'b1000; SEL = 2'b01; #10;
   sA = 4'b0001; sB = 4'b0010; sC = 4'b0100; sD = 4'b1000; SEL = 2'b10; #10;
   sA = 4'b0001; sB = 4'b0010; sC = 4'b0100; sD = 4'b1000; SEL = 2'b11;
   
 end
endmodule
