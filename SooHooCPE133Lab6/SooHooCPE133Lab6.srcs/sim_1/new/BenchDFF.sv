`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/02/2021 07:08:24 PM
// Design Name: Problem2ClockDivider
// Module Name: BenchDFF
// Project Name: Lab 6
// Target Devices: Basys-3
//////////////////////////////////////////////////////////////////////////////////

//module d_ff(
//    input logic clk,
//    input logic d,
//    input logic rst,
//    output logic q
//    );
    
//    assign q = 0;
    
//    always_ff @ (posedge clk or posedge rst)
//        if (rst == 1'b1)
//            q <= 1'b0;
//        else
//            q <= d;
//endmodule

module BenchDFF();
 // Inputs
 reg D;
 reg Clk;
 reg Reset;
 // Outputs
 logic Q;
 // Instantiate the Unit Under Test (UUT)
 d_ff uut (.clk(Clk), .d(D), .rst(Reset), .q(Q));
 initial begin
  // Initialize Inputs
  D = 1'b0;
  Clk = 1'b0;
  Reset = 1'b1;
  // Wait 100 ns for global reset to finish
  #100;
  // Add stimulus here
  Reset = 1'b0;
  #20;
  forever #40 D = ~ D;
 end
   always #10 Clk = ~Clk;  
endmodule
