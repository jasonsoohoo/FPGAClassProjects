`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/28/2021 06:14:43 PM
// Design Name: Problem1FourBitCounter
// Module Name: jk_ff
// Project Name: Lab 6
// Target Devices: Basys-3
// Description: JK_FF written with Behavioral Logic
//////////////////////////////////////////////////////////////////////////////////


module jk_ff(
    input j,
    input k,
    input clk,
    input rst,
    output logic q,
    output logic qbar
    );
    
    assign q = 0;
    
    always @ (posedge clk)
       if (rst)
        q = 0;
       else
       case ({j,k})
          2'b00 :  q <= q;
          2'b01 :  q <= 0;
          2'b10 :  q <= 1;
          2'b11 :  q <= ~q;
       endcase
       assign qbar = ~q;
 endmodule
