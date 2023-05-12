`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/02/2021 04:41:58 PM
// Design Name: Problem3SevenSegment
// Module Name: BenchFourToSevenSeg
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////


module BenchFourToSevenSeg();
    logic [3:0] sDin;
    logic [6:0] sSeg;
    FourTo7SegementDecoder uut (.Din(sDin), .Seg(sSeg));
    
    initial begin
        assign sDin = 4'b0000; #10;//0
        assign sDin = 4'b0001; #10;//1
        assign sDin = 4'b0010; #10;//2
        assign sDin = 4'b0011; #10;//3
        assign sDin = 4'b0100; #10;//4
        assign sDin = 4'b0101; #10;//5
        assign sDin = 4'b0110; #10;//6
        assign sDin = 4'b0111; #10;//7
        assign sDin = 4'b1000; #10;//8
        assign sDin = 4'b1001; #10;//9
        assign sDin = 4'b1010; #10;//A
        assign sDin = 4'b1011; #10;//B
        assign sDin = 4'b1100; #10;//C
        assign sDin = 4'b1101; #10;//D
        assign sDin = 4'b1110; #10;//E
        assign sDin = 4'b1111;     //F
    end
endmodule
