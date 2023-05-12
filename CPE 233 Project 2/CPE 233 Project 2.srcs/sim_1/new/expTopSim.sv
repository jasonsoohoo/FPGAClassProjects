`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 07:36:27 PM
// Design Name: 
// Module Name: expTopSim
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


module expTopSim();

logic clk = 0;
logic rst, write;
    
//module experiment2Top(
//    input rst, PCWrite,
//    input [1:0] pcSource,
//    input clk,
//    output [31:0] ir

logic [31:0] ir;
logic [1:0] source;

initial forever #5 clk = ~clk;
experiment2Top  UUT (.rst(rst), .PCWrite(write), .pcSource(source), .clk(clk), .ir(ir));
initial begin
    rst = 1; write = 0; source=00; #10;
    rst = 0; write = 1; source=00; #40;
    rst = 0; write = 0; source=00; #10;
    rst = 0; write = 1; source=00; #30;
    rst = 0; write = 1; source=01; #20;
    rst = 0; write = 1; source=10; #20;
    rst = 0; write = 1; source=11; #20;
    
//    rst = 0; write = 1; source=11; #10;
//    rst = 0; write = 1; source=00; #10;
//    rst = 0; write = 1; source=00; #10;
    
end

endmodule
