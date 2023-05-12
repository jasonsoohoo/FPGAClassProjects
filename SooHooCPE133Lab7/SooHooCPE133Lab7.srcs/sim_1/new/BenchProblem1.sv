`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/10/2021 01:36:24 PM 
// Module Name: BenchProblem1
//////////////////////////////////////////////////////////////////////////////////


module BenchProblem1();
//    input EIN,
//    input RST,
//    input CLK,
//    input [15:0] SWITCHES,
//    output [15:0] LED_SIG //was reg
    logic sEIN, sRST;
    logic [15:0] sDin, sLED;
    reg sclk = 0;
    parameter PERIOD = 5;
    
    always #PERIOD sclk=~sclk;
    
    Problem1FSMSequencer UUT (.EIN(sEIN), .RST(sRST), .CLK(sclk), .SWITCHES(sDin), .LED_SIG(sLED));
    
    initial begin
        assign sRST = 1'b1; #5
        assign sDin = 16'b1011000000001101; #5;
        assign sRST = 1'b0; assign sEIN = 1'b1; #7000;
        assign sEIN = 1'b0;
    end
endmodule
