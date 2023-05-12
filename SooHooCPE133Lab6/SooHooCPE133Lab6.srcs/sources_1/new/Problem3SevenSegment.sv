`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly 
// Engineer: 
// 
// Create Date: 03/01/2021 08:14:08 PM
// Design Name: 
// Module Name: Problem3SevenSegment
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

//SHOULD WRITE A RESET INSTEAD OF INITIALIZING VALUES INTO REGISTERS
module Problem3SevenSegment(
    input clk,
    input [15:0] Din,
    output reg [3:0] sANO = 4'b0000,
    output reg [6:0] sLED = 7'b0000000
    );
    
    reg [3:0] activated_anode;
    
//    Problem1FourBitCounter countToFour (.CEN(1'b1), .RST(counter_rst), .DIR(1'b1), .CLK(clk), .OUT(active_anode_count));
    
//    reg [3:0] sclk;
//    Problem2ClockDivider divider (.clk(clk), .rst(1'b0), .sclk(sclk));
    
    reg [6:0] dOut0, dOut1, dOut2, dOut3;
    FourTo7SegementDecoder display1 (.Din(Din[15:12]), .Seg(dOut0));
    FourTo7SegementDecoder display2 (.Din(Din[11:8]), .Seg(dOut1));
    FourTo7SegementDecoder display3 (.Din(Din[7:4]), .Seg(dOut2));
    FourTo7SegementDecoder display4 (.Din(Din[3:0]), .Seg(dOut3));
    
    reg w, x, y, z;
//    logic [6:0] ledOut;
    reg [19:0] counter={20{1'b0}};
    
    always@(posedge clk) begin
        counter = counter + 1'b1;
        counter = (counter === {20{1'b1}}) ? {20{1'b0}} : counter;
//        w = active_anode_count === 4'b0000;
//        x = active_anode_count === 4'b0001;
//        y = active_anode_count === 4'b0010;
//        z = active_anode_count === 4'b0011;
        w = counter[19:18] === 2'b00;
        x = counter[19:18] === 2'b01;
        y = counter[19:18] === 2'b10;
        z = counter[19:18] === 2'b11;
        activated_anode = {w, x, y, z};
////        activated_anode = {1'b0, 1'b0, 1'b0, 1'b1};
//        sLED = (w==1) ? dOut0 : sLED;
//        sLED = (x==1) ? dOut1 : sLED;
//        sLED = (y==1) ? dOut2 : sLED;
//        sLED = (z==1) ? dOut3 : sLED;
//        sANO = ~activated_anode;
//        sLED = (dOut0 & {7{w}}) + (dOut1 & {7{x}}) + (dOut2 & {7{y}}) + (dOut3 & {7{z}});
//        ledOut = dOut3;
    end
    
    //constant assignment
    always@(*) begin
        sLED = (w===1'b1) ? dOut0 : sLED;
        sLED = (x===1'b1) ? dOut1 : sLED;
        sLED = (y===1'b1) ? dOut2 : sLED;
        sLED = (z===1'b1) ? dOut3 : sLED;
        sANO = ~activated_anode;
    end
    
//    always@(negedge clk) begin
//        counter_rst = active_anode_count === 4'b0100;
//    end
    
//    assign sANO = ~activated_anode;
//    assign sLED = ledOut;
endmodule
