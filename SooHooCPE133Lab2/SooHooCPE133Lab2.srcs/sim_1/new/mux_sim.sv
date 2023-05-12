`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: mux_sim
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: Simulates Four2To1Muxs
//////////////////////////////////////////////////////////////////////////////////


module mux_sim();
 logic [3:0] sA, sB, sResult;
 logic sSel;
 //Unit under test is Module: Problem1Schematic
 Four2To1Muxs UUT ( .A(sA), .B(sB), .SEL(sSel), .RES(sResult));

 initial begin
   sA = 4'b0000; sB = 4'b0000; sSel = 0; #10;
   sA = 4'b0000; sB = 4'b1111; sSel = 0; #10;
   sA = 4'b1111; sB = 4'b0000; sSel = 1; #10;
   sA = 4'b1111; sB = 4'b1111; sSel = 1; #10;
   sA = 4'b0011; sB = 4'b0101; sSel = 0;
 end

endmodule
