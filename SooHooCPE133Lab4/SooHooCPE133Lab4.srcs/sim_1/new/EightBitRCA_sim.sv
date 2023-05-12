`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 02/14/2021 10:25:45 PM
// Design Name: 
// Module Name: EightBitRCA_sim
//////////////////////////////////////////////////////////////////////////////////


module EightBitRCA_sim();
//Creation of signals
 logic [7:0] sA, sB, sResult;
 logic Cin, Cout;

 RCA_8B UUT ( .A(sA), .B(sB), .Cin(Cin), .S(sResult), .Cout(Cout));

 initial begin
    
   sA = 8'b00000011; sB = 8'b11111000; Cin = 0; #10; //11111011
   sA = 8'b11110000; sB = 8'b00001111; Cin = 0; #10; //11111111
   sA = 8'b10101010; sB = 8'b01010101; Cin = 0; #10; //11111111
   sA = 8'b10000001; sB = 8'b00000000; Cin = 0; #10; //10000001
   sA = 8'b10000111; sB = 8'b00000111; Cin = 0; #10; //10001110
 end
endmodule
