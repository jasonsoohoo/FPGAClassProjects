`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/02/2021 07:08:24 PM
// Design Name: Problem2ClockDivider
// Module Name: BenchProblem2
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////


module BenchProblem2();
//module Problem2ClockDivider(
//    input clk,
//    input rst,
//    output [2:0] sclk
//    );
    
//    parameter BITWIDTH_25 = 2;
//    parameter BITWIDTH_6_25 = 4;
//    parameter BITWIDTH_1_56 = 6;
logic clock=1'b0, sRST=1'b1;
reg [2:0] ssclk;
parameter CLOCK_PERIOD = 10;

always#(CLOCK_PERIOD/2) clock = ~clock;

Problem2ClockDivider UUT (.clk(clock), .rst(sRST), .sclk(ssclk));

integer no_clock1=0, no_clock2=0, no_clock3=0, no_clock0=0;

always@(posedge clock)
no_clock0 = no_clock0 + 1;

always@(posedge ssclk[0])
no_clock1 = no_clock1 + 1;

always@(posedge ssclk[1])
no_clock2 = no_clock2 + 1;

always@(posedge ssclk[2])
no_clock3 = no_clock3 + 1;

initial
begin
#1000
no_clock0 = 0;
assign sRST = 1'b0;
#50000
$display("End of Simulation Time:%d, Origin Clock Count:%d,Clock 1:%d, Clock 2:%d, Clock 3:%d", $time, no_clock0, no_clock1, no_clock2, no_clock3);
end
endmodule
