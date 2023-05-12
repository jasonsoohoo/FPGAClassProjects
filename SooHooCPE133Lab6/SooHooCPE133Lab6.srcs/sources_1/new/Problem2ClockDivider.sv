`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/28/2021 08:39:09 PM
// Design Name: Problem2ClockDivider
// Module Name: Problem2ClockDivider
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////

//THE MODULE OF ULTIMATE VERBOSITY
module Problem2ClockDivider(
    input clk,
    input rst,
    output reg [2:0] sclk
    );
    
    parameter BITWIDTH_25 = 2;
    parameter BITWIDTH_6_25 = 4;
    parameter BITWIDTH_1_56 = 6;
    
    logic [BITWIDTH_25-1:0] din;
    logic [BITWIDTH_25-1:0] clkdiv;
    logic [BITWIDTH_6_25-1:0] din1;
    logic [BITWIDTH_6_25-1:0] clkdiv1;
    logic [BITWIDTH_1_56-1:0] din2;
    logic [BITWIDTH_1_56-1:0] clkdiv2;
    
    d_ff dff_inst0 (
        .clk(clk),
        .rst(rst),
        .d(din[0]),
        .q(clkdiv[0])
        );
    
    d_ff dff_inst1 (
        .clk(clk),
        .rst(rst),
        .d(din1[0]),
        .q(clkdiv1[0])
        );
        
    d_ff dff_inst2 (
        .clk(clk),
        .rst(rst),
        .d(din2[0]),
        .q(clkdiv2[0])
        );
        
    genvar i;
    generate
    for (i=1; i < BITWIDTH_25; i=i+1)
    begin : dff_gen_label
        d_ff dff_inst (
            .clk(clkdiv[i-1]),
            .rst(rst),
            .d(din[i]),
            .q(clkdiv[i])
        );
        end
    endgenerate;
    
    genvar ii;
    generate
    for (ii=1; ii < BITWIDTH_6_25; ii=ii+1)
    begin : dff_gen_label_1
        d_ff dff_inst (
            .clk(clkdiv1[ii-1]),
            .rst(rst),
            .d(din1[ii]),
            .q(clkdiv1[ii])
        );
        end
    endgenerate;
    
    genvar iii;
    generate
    for (iii=1; iii < BITWIDTH_1_56; iii=iii+1)
    begin : dff_gen_label_2
        d_ff dff_inst (
            .clk(clkdiv2[iii-1]),
            .rst(rst),
            .d(din2[iii]),
            .q(clkdiv2[iii])
        );
        end
    endgenerate;
    
    assign din = ~clkdiv;
    assign sclk[0] = clkdiv[BITWIDTH_25-1];
    
    assign din1 = ~clkdiv1;
    assign sclk[1] = clkdiv1[BITWIDTH_6_25-1];
    
    assign din2 = ~clkdiv2;
    assign sclk[2] = clkdiv2[BITWIDTH_1_56-1];
    
endmodule
