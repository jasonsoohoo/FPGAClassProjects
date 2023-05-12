`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 04:09:28 PM
// Design Name: 
// Module Name: experiment2Top
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


module experiment2Top(
    input rst, PCWrite,
    input [1:0] pcSource,
    input clk,
    output [31:0] ir
    );
    
    logic [31:0] p_count;
    PC_MOD pc(.rst(rst), .clk(clk), .PCWrite(PCWrite),
     .jalr('h0x0000_4444), .branch('h0x0000_8888),
     .jal('h0x0000_CCCC), .pcSource(pcSource), .pc(p_count));
    Memory OTTER_MEMORY (
        .MEM_CLK (clk),
        .MEM_RDEN1 (1),
        .MEM_RDEN2 (0),
        .MEM_WE2 (0),
        .MEM_ADDR1 (p_count[15:2]),
        .MEM_ADDR2 (0),
        .MEM_DIN2 (0),
        .MEM_SIZE (2),
        .MEM_SIGN (0),
        .IO_IN (0),
        .IO_WR (),
        .MEM_DOUT1 (ir),
        .MEM_DOUT2 () ); 
endmodule
