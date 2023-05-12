`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/17/2021 08:43:00 PM
// Design Name: Schematic
// Module Name: Problem1Schematic
// Project Name: Lab 0
// Target Devices: Basys3
// Description: Derived from Schematic
//////////////////////////////////////////////////////////////////////////////////


module Problem1Schematic(
    input A,
    input B,
    input C,
    input D,
    output X,
    output Y,
    output Z
    );
    
    //1-bit, 4-state datatype -- basically a wire
    logic anot, cnot, dnot, and_abc, nand_ac, and_ad, nand_bc, and_bcd;
    
    //assignment for inverted inputs
    not(anot, A);
    not(cnot, C);
    not(dnot, D);
    
    //assignment of 5 and/nand logic gates (first tier of given schematic)
    and(and_abc, anot, B, C);
    nand(nand_ac, A, C);
    and(and_ad, A, dnot);
    nand(nand_bc, B, C);
    and(and_bcd, B, cnot, D);
    
    //assignment of 3 or/nor gates directly to output
    or(X, and_abc, nand_ac, and_ad);
    nor(Y, and_ad, nand_bc);
    or(Z, nand_bc, and_bcd);
endmodule
