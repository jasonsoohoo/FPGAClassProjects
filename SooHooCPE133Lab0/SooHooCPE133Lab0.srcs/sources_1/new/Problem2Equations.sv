`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SOoHoo
// 
// Create Date: 01/17/2021 08:43:00 PM (LIES! I swear)
// Design Name: Schematic
// Module Name: Problem2Equation
// Project Name: Lab 0
// Target Devices: Basys3
// Description: Derived from Equation
//////////////////////////////////////////////////////////////////////////////////


module Problem2Equations(
    input A,
    input B,
    input C,
    input D,
    output X,
    output Y
    );
    
    //wires
    logic anot, bnot, cnot, dnot, and_nac, and_anbnd, and_acd, and_anb, and_bd,
    and_cd, and_ab, and_anc, and_nanb, or_acabd, or_abbd, or_cdab, or_acab;
    
    //assignment of inverted inputs
    not(anot, A);
    not(bnot, B);
    not(cnot, C);
    not(dnot, D);
    
    // and gate assignments
    and(and_nac, anot, C);
    and(and_anbnd, A, bnot, dnot);
    and(and_acd, A, C, D);
    and(and_anb, A, bnot);
    and(and_bd, B, D);
    and(and_cd, C, D);
    and(and_ab, A, B);
    and(and_anc, A, cnot);
    and(and_nanb, anot, B);
    
    //assignment of second tier or gates
    or(or_acabd, and_nac, and_anbnd);
    or(or_abbd, and_anb, and_bd);
    or(or_cdab, and_cd, and_ab);
    or(or_acab, and_anc, and_nanb); 
    
    //final output assignment using xor gates
    xor(X, or_acabd, and_acd, or_abbd);
    xor(Y, or_cdab, or_acab);
endmodule
