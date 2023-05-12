`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 06:48:38 PM
// Design Name: 
// Module Name: FourTo7SegementDecoder
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


module FourTo7SegementDecoder(
    input [3:0] Din,
    output [6:0] Seg
    );
    
    // 4-Bit Input -- (MSB) W X Y Z (LSB)
    // 7-Bit Output -- (MSB) A B C D E F G (LSB)
    
    //ASSIGNING INPUTS TO RECOGNIZABLE NAME SPACE
    logic W, X, Y, Z;
    logic A, B, C, D, E, F, G;
    
    assign W = Din[3];
    assign X = Din[2];
    assign Y = Din[1];
    assign Z = Din[0];
    
    //DATAFLOW STYLE DECODER USING MINIMIZED BOOL LOGIC
    //NEXT TIME JUST USE ? : CONDITIONALS?
    assign A = (W|X|Y|~Z) & (W|~X|Y|Z);
    assign B = (~X|~Y|Z) & (~W|~X|Z) & (~W|~X|~Y) & (W|~X|Y|~Z);
    assign C = (~W|~X|~Y) & (~W|~X|Z) & (W|X|~Y|Z);
    assign D = (~X|~Y|~Z) & (X|Y|~Z) & (W|~X|Y|Z) & (~W|X|~Y|Z);
    assign E = (W|~Z) & (W|~X|Y) & (X|Y|~Z);
    assign F = (W|X|~Z) & (W|X|~Y) & (W|~Y|~Z) & (~W|~X|Y|~Z);
    assign G = (W|X|Y) & (~W|~X|Y) & (W|~X|~Y|~Z);
    
    //FINAL ASSIGNMENT TO OUTPUT BUS
    //TO ILLUMINATE SIGNAL SHOULD BE LOW
    assign Seg = {~A, ~B, ~C, ~D, ~E, ~F, ~G};
endmodule
