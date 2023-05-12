`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 10:25:45 PM
// Design Name: 
// Module Name: FourBitShiftSim
//////////////////////////////////////////////////////////////////////////////////


module FourBitShiftSim();
//Creation of signals
 logic [3:0] Din, Dout;
 logic DIR, ROT;

 FourBitShifter UUT ( .Din(Din), .DIR(DIR), .ROT(ROT), .Dout(Dout));

 initial begin
    
   Din = 4'b1001; DIR = 0; ROT = 0; #10; // 0010
   Din = 4'b1001; DIR = 0; ROT = 1; #10; // 0011
   Din = 4'b1001; DIR = 1; ROT = 0; #10; // 0100
   Din = 4'b1001; DIR = 1; ROT = 1;      // 1100
   
 end
endmodule
