`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 01/31/2021 09:44:40 PM
// Module Name: Problem1MuxCircuit
// Project Name: Problem1MuxCircuit
// Target Devices: Basys - 3
// Tool Versions: 
// Description: Mux Circuit From Diagram
//////////////////////////////////////////////////////////////////////////////////


module Problem1MuxCircuit(
    input [3:0] A,
    input [3:0] B,
    input [1:0] SEL,
    output [3:0] RESULT
    );
    
    logic [3:0] nand_AB, xor_AB, mux_out1, not_mux_out;
    
    FourAndGates nand_gate (.A(A), .B(B), .O(nand_AB));
    FourXorGates xor_gate (.A(A), .B(B), .O(xor_AB));
    Four2To1Muxs mux1 (.A(nand_AB), .B(xor_AB), .SEL(SEL[0]), .RES(mux_out1));
    FourInvert inversion_gate (.A(mux_out1), .O(not_mux_out));
    Four2To1Muxs mux2 (.A(mux_out1), .B(not_mux_out), .SEL(SEL[1]), .RES(RESULT));
    
//    FourAndGates nandGate (.A(A), .B(B), .O(nand_AB));
endmodule
