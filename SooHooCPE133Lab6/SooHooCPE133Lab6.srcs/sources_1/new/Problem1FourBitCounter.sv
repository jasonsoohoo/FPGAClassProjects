`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason Soohoo
// 
// Create Date: 02/28/2021 07:29:00 PM
// Design Name: Problem1FourBitCounter
// Module Name: Problem1FourBitCounter
// Project Name: Lab 6
// Target Devices: Basys-3
// Description: The module consists of 1 jk_ff and 3 modified jk_ff to accomodate logic gates.
//////////////////////////////////////////////////////////////////////////////////


module Problem1FourBitCounter(
    input CEN,
    input RST,
    input DIR,
    input CLK,
    output [3:0] OUT
    );
    
    logic high;
    assign high = 1'b1;
    
    logic UDQOut1, UDQOut2, UDQNOut1, UDQNOut2;
    logic QOut0, QOut1, QOut2, QOut3, QNOut0, QNOut1, QNOut2;
    
    logic eClk;
    assign eClk = CLK & CEN;
    
    jk_ff initial_ff (.j(high), .k(high), .clk(eClk), .rst(RST), .q(QOut0), .qbar(QNOut0));
    jk_ff_wLogic log_ff_1 (.CLK(eClk), .UDQ(DIR), .Q(QOut0), .UDQN(~DIR), .QN(QNOut0), .RST(RST), .UDQO(UDQOut1), .QO(QOut1), .UDQNO(UDQNOut1), .QNO(QNOut1));
    jk_ff_wLogic log_ff_2 (.CLK(eClk), .UDQ(UDQOut1), .Q(QOut1), .UDQN(UDQNOut1), .QN(QNOut1), .RST(RST), .UDQO(UDQOut2), .QO(QOut2), .UDQNO(UDQNOut2), .QNO(QNOut2));
    jk_ff_wLogic log_ff_3 (.CLK(eClk), .UDQ(UDQOut2), .Q(QOut2), .UDQN(UDQNOut2), .QN(QNOut2), .RST(RST), .UDQO(), .QO(QOut3), .UDQNO(), .QNO());
    
    assign OUT = {QOut3, QOut2, QOut1, QOut0};
    
endmodule
