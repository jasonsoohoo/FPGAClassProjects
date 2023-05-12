`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 04:09:59 PM
// Design Name: 
// Module Name: PC_MOD
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


module PC_MOD(
    input rst, clk, PCWrite, 
    input [31:0] jalr, branch, jal,
    input [1:0] pcSource,
    output logic [31:0] pc
    );
    
    logic [31:0] pc_out, mux_out;
    reg_nb #(.n(32)) MY_REG (
       .data_in  (mux_out), 
       .ld       (PCWrite), 
       .clk      (clk), 
       .clr      (rst && clk), 
       .data_out (pc_out));
    mux_4t1_nb  #(.n(32)) my_4t1_mux  (
       .SEL   (pcSource), 
       .D0    (pc_out + 4), 
       .D1    (jalr), 
       .D2    (branch), 
       .D3    (jal),
       .D_OUT (mux_out) );   
    
    assign pc[15:2] = pc_out[15:2];
endmodule
