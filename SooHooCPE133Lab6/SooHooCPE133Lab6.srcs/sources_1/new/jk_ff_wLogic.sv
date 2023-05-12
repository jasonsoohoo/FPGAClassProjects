`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly 
// Engineer: Jason SooHoo
// 
// Create Date: 02/28/2021 07:14:07 PM
// Design Name: Problem1FourBitCounter
// Module Name: jk_ff_wLogic
// Project Name: Lab 6
// Target Devices: Basys-3
// Description: JK_FF with attached logic gates for the UP/DOWN counter
//////////////////////////////////////////////////////////////////////////////////


module jk_ff_wLogic(
    input CLK,
    input UDQ,
    input Q,
    input UDQN,
    input QN,
    input RST,
    output UDQO,
    output QO,
    output UDQNO,
    output QNO
    );
    
    logic jk_out;
    
    up_down_logic logicGates (.Q(Q), .UDQ(UDQ), .QN(QN), .UDQN(UDQN), .UDQO(UDQO), .UDQNO(UDQNO), .JK(jk_out));
    jk_ff jkff (.j(jk_out), .k(jk_out), .clk(CLK), .rst(RST), .q(QO), .qbar(QNO));
    
endmodule
