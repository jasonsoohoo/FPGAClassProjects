`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/02/2021 08:31:28 PM
// Design Name: Problem1FourBitCounter
// Module Name: BenchJK_FF
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////


module BenchJK_FF();

//    input j,
//    input k,
//    input clk,
//    input rst,
//    output logic q,
//    output logic qbar  
  
reg J,K, CLK;
wire Q, QBAR;

jk_ff UUT(.q(Q), .qbar(QBAR), .j(J), .k(K), .clk(CLK));
initial begin
  CLK=0;
     forever #10 CLK = ~CLK;  
end 
initial begin 
 J= 1; K= 0;
 #100; J= 0; K= 1; 
 #100; J= 0; K= 0; 
 #100; J= 1; K=1; 
end 
endmodule
