`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly 
// Engineer: Jason SooHoo
// 
// Create Date: 02/28/2021 08:35:10 PM
// Design Name: Problem2ClockDivider
// Module Name: d_ff
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////


module d_ff(
    input logic clk,
    input logic d,
    input logic rst,
    output logic q
    );
    
    assign q = 0;
    
    always_ff @ (posedge clk or posedge rst)
        if (rst == 1'b1)
            q <= 1'b0;
        else
            q <= d;
endmodule
