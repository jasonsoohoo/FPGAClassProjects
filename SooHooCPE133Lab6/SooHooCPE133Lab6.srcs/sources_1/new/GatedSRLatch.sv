`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 04:18:04 PM
// Design Name: 
// Module Name: GatedSRLatch
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


module GatedSRLatch(
    output Q,
    output QN,
    input J,
    input GATE, //GATE WILL MOST LIKELY BE CLK
    input K
    );
    
    logic sJ, sK;
    
    // GATE AND CLR LOGIC
    assign sJ = ~(QN & J & GATE);
    assign sK = ~(Q & K & GATE);
    
    assign Q = ~(sJ & QN);
    assign QN = ~(sK & Q);
    
endmodule
