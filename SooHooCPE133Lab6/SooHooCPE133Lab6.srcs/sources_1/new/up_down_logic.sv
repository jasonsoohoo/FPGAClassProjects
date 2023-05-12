`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/28/2021 07:03:53 PM
// Design Name: Problem1FourBitCounter
// Module Name: up_down_logic
// Project Name: Lab 6
// Target Devices: Basys-3
// Description: Logic Gates to attach to a JK_FF for the UP/DOWN counter.
//////////////////////////////////////////////////////////////////////////////////


module up_down_logic(
    input Q,
    input UDQ,
    input QN,
    input UDQN,
    output UDQO,
    output UDQNO,
    output JK
    );
    
    assign UDQO = UDQ & Q;
    assign UDQNO = UDQN & QN;
    
    assign JK = UDQO | UDQNO;
endmodule
