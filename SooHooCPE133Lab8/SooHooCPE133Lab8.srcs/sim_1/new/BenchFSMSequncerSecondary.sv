`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/13/2021 08:28:25 PM
// Module Name: BenchFSMSequncerSecondary
// Project Name: Project 8
//////////////////////////////////////////////////////////////////////////////////


module BenchFSMSequncerSecondary();
    logic sPulse, sOut, sRST;
    reg sclk = 0;
    parameter PERIOD = 5;
    
    always #PERIOD sclk=~sclk;
    
    FSM_Secondary UUT (.DIN(sPulse), .CLK(sclk), .RST(sRST), .DOUT(sOut));
    
    initial begin 
        assign sRST = 1'b1; #10;
        assign sRST = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0; #10;
        assign sPulse = 1'b1; #10;
        assign sPulse = 1'b0;
        
    end
endmodule
