`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2021 06:56:53 PM
// Design Name: 
// Module Name: Problem1NANDCell
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


module Problem1NANDCell(
    input S,
    input R,
    output Q,
    output Qnot);
    
    logic Qout, Qnout;
    
    nand #1 (Qout, S, Qnout);
    nand #1 (Qnout, R, Qout);
    
    assign Q = Qout;
    assign Qnot = Qnout;
    
endmodule
