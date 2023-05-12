`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/07/2021 03:02:54 AM
// Design Name: LAB 3
// Module Name: Problem1RCA
// Target Devices: Basys-3
// Description: Main Module
//////////////////////////////////////////////////////////////////////////////////


module Problem1RCA(
    input [3:0] A,
    input [3:0] B,
    input SEL,
    output [3:0] S,
    output ERR
    );
    
    logic [3:0] result, not_b, b_input;
    logic carry_out;
    
    FourInvert invert_subtrahend (.A(B), .O(not_b));
    Four2To1Muxs choose_b_input (.A(B), .B(not_b), .SEL(SEL), .RES(b_input));
    
    RCA_4B ripple_adder (.A(A), .B(b_input), .Cin(SEL), .S(result), .Cout(carry_out));
    
    ERROR_CHK error_checker (.A(A[3]), .B(B[3]), .R(result[3]), .SEL(SEL), .ERR(ERR));
    
    assign S = result;
endmodule
