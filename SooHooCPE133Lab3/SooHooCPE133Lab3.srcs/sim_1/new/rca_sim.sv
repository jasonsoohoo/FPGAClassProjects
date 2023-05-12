`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/07/2021 03:02:54 AM
// Design Name: LAB 3
// Module Name: Problem1RCA
// Target Devices: Basys-3
// Description: RCA Sim
//////////////////////////////////////////////////////////////////////////////////


module rca_sim();
//Creation of signals
 logic [3:0] sA, sB, sResult;
 logic Cin, Cout;

 RCA_4B UUT ( .A(sA), .B(sB), .Cin(Cin), .S(sResult), .Cout(Cout));

 initial begin
    
   sA = 4'b1001; sB = 4'b0010; Cin = 1; #10;
   sA = 4'b1111; sB = 4'b1001; Cin = 0; #10;
   sA = 4'b1011; sB = 4'b1010; Cin = 0; #10;
   sA = 4'b1110; sB = 4'b0000; Cin = 0; #10;
   sA = 4'b1011; sB = 4'b0101; Cin = 0; #10;
 end
endmodule