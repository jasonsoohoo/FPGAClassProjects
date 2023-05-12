`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/02/2021 08:31:28 PM
// Design Name: Problem1FourBitCounter
// Module Name: BenchProblem1
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////


module BenchProblem1();
//    input CEN,
//    input RST,
//    input DIR,
//    input CLK,
//    output [3:0] OUT
logic clock=1'b0, sRST=1'b1, sENB=1'b0, sDIR=1'b0;
logic [3:0] sOut;
parameter CLOCK_PERIOD = 10;

always#(CLOCK_PERIOD/2) clock = ~clock;

Problem1FourBitCounter UUT (.CEN(sENB), .RST(sRST), .DIR(sDIR), .CLK(clock), .OUT(sOut));

initial begin
    #10; assign sRST = 1'b0;
    #10; assign sENB = 1'b1;
    #160; assign sDIR = 1'b1;
    #320; assign sENB = 1'b0;
end

endmodule
