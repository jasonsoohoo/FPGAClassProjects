`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2021 10:11:19 PM
// Design Name: 
// Module Name: Problem3MinimalTruthTables
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:s
// 
//////////////////////////////////////////////////////////////////////////////////


module Problem3MinimalTruthTables(
    input A,
    input B,
    input C,
    input D,
    output X,
    output Y
    );
    
    // creation of wires
    logic anot, bnot, cnot, dnot, and_nbd, and_bncnd, and_abnd,
    and_nabnc, and_ancd, and_nacd, and_abc;
    
    //implementation of not gates -- inversion
    not(anot, A);
    not(bnot, B);
    not(cnot, C);
    not(dnot, D);
    
    // X Tier and gates
    and(and_nbc, bnot, D);
    and(and_bncnd, B, cnot, dnot);
    and(and_abnc, A, B, dnot);

    // Y Tier and gates    
    and(and_nabnc, anot, B, cnot);
    and(and_ancd, A, cnot, D);
    and(and_nacd, anot, C, D);
    and(and_abc, A, B, C);
    
    //Final gates direct to output
    or(X, and_nbc, and_bncnd, and_abnc);
    or(Y, and_nabnc, and_ancd, and_nacd, and_abc);
endmodule
