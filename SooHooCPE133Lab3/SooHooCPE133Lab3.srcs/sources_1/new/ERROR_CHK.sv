`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 10:09:00 PM
// Design Name: 
// Module Name: ERROR_CHK
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


module ERROR_CHK(
    input A,
    input B,
    input R,
    input SEL,
    output ERR
    );
    
    logic mux_out1, mux_out2, xnor_out, xor_out;
    
    TwoToOneMux mux1 (.A(A), .B(R), .SEL(SEL), .RES(mux_out1));
    TwoToOneMux mux2 (.A(R), .B(A), .SEL(SEL), .RES(mux_out2));
    
    xnor(xnor_out, B, mux_out1);
    xor(xor_out, mux_out2, B);
    
    and(ERR, xnor_out, xor_out);
    
endmodule
