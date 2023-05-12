`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/13/2021 08:28:25 PM
// Module Name: BenchProblem1FSPlus
// Project Name: Project 8
//////////////////////////////////////////////////////////////////////////////////


module BenchProblem1FSPlus();
//    input [15:0] DIN,
//    input EIN,
//    input CLK,
//    input RST,
//    output logic [15:0] DOUT

    logic [15:0] sIN, sOUT;
    logic sEIN, sCLK, sRST;
    
    Problem1SequenceDetectorPlus UUT (.DIN(sIN), .EIN(sEIN), .CLK(sCLK), .RST(sRST), .DOUT(sOUT));
    
    initial begin
        sCLK = 1'b0;
        forever begin
            #10 sCLK = ~sCLK;
        end 
    end
    
    initial begin
        assign sEIN = 1'b1;
        assign sRST = 1'b1;
        #10 assign sRST = 1'b0;
        @(posedge sCLK) assign sIN = 16'b0101110101011101; 
    end
endmodule
