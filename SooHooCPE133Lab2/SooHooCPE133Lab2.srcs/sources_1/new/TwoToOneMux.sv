`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: TwoToOneMux
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: 2:1 Mux Circuit. When SEL is 0 A is selected by default
//////////////////////////////////////////////////////////////////////////////////



module TwoToOneMux(
    input A,
    input B,
    input SEL,
    output RES
    );
    
    logic nand_ASEL, nand_BNSEL, not_SEL;
    
    not(not_SEL, SEL);
    
    nand(nand_ASEL, SEL, B);
    nand(nand_BNSEL, not_SEL, A);
    nand(RES, nand_ASEL, nand_BNSEL);
    
endmodule
