`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 08:21:11 PM
// Module Name: FourBitShifter
//////////////////////////////////////////////////////////////////////////////////


module FourBitShifter(
    input [3:0] Din,
    input DIR,
    input ROT,
    output [3:0] Dout
    );
    
    logic zero_value;
    assign zero_value = 1'b0;
    
    logic [1:0] select;
    assign select = {DIR, ROT};
    
    FourToOneMux fourM1 (.A(Din[2]), .B(Din[2]), .C(zero_value), .D(Din[0]), .SEL(select), .O(Dout[3]));
    FourToOneMux fourM2 (.A(Din[1]), .B(Din[1]), .C(Din[3]), .D(Din[3]), .SEL(select), .O(Dout[2]));
    FourToOneMux fourM3 (.A(Din[0]), .B(Din[0]), .C(Din[2]), .D(Din[2]), .SEL(select), .O(Dout[1]));
    FourToOneMux fourM4 (.A(zero_value), .B(Din[3]), .C(Din[1]), .D(Din[1]), .SEL(select), .O(Dout[0]));
    
endmodule
