`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 04:41:58 PM
// Design Name: 
// Module Name: BenchProblem3
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


module BenchProblem3();
logic clock;
parameter CLOCK_PERIOD = 10;
initial clock = 1'b0;

always#(CLOCK_PERIOD/2) clock = ~clock;

logic [15:0] sDin;
assign sDin = 16'b0001001000110100;
reg [3:0] ssANO;
reg [6:0] ssLED;

Problem3SevenSegment UUT (.clk(clock), .Din(sDin), .sANO(ssANO), .sLED(ssLED));

endmodule
