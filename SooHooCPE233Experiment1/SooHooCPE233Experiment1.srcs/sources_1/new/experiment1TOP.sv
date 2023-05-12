`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 10:26:35 PM
// Design Name: 
// Module Name: experiment1TOP
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


module experiment1TOP(
    input go,
    input rst,
    input clk,
//    output logic [3:0] state,
    output logic [7:0] seg,
    output logic [3:0] an);
    
    logic load, enable, rst_cnt; //LOADS A 1 into the first register / enables the counting operation
    logic internal_clk;
    logic [15:0] reg_0_out, mux_0_out, reg_1_out, mux_1_out, rca_out;
    
    clk_2n_div_test #(.n(25)) CLK_DIV (
          .clockin   (clk), 
          .fclk_only (0),          
          .clockout  (internal_clk));
          
    mux_2t1_nb  #(.n(16)) my_2t1_mux_0  (
       .SEL   (load), 
       .D0    (rca_out), 
       .D1    (16'b0000000000000000), 
       .D_OUT (mux_0_out));  
          
    reg_nb #(.n(16)) REG_0 (
          .data_in  (mux_0_out), 
          .ld       (enable), 
          .clk      (internal_clk), 
          .clr      (rst || rst_cnt), 
          .data_out (reg_0_out));
          
    mux_2t1_nb  #(.n(16)) my_2t1_mux_1  (
       .SEL   (load), 
       .D0    (reg_0_out), 
       .D1    (16'b0000000000000001), 
       .D_OUT (mux_1_out));  
       
    reg_nb #(.n(16)) REG_1 (
          .data_in  (mux_1_out), 
          .ld       (enable), 
          .clk      (internal_clk), 
          .clr      (rst || rst_cnt), 
          .data_out (reg_1_out));
    
    rca_nb #(.n(16)) FIB_RCA (
          .a   (reg_0_out), 
          .b   (reg_1_out), 
          .cin (), 
          .sum (rca_out), 
          .co  ()
          );
          
   logic is_odd; //info
          
   comp_nb #(.n(1)) ODD_COMP (
          .a  (rca_out[0]), 
          .b  (1'b1), 
          .eq (is_odd), 
          .gt (), 
          .lt ()
          );
   
   logic we, up; //CONTROL SIG
   logic [15:0] ram_dout;
   logic [4:0] r_addr;
   
   logic rco_out;
   
   cntr_up_clr_nb #(.n(4)) MY_CNTR (
     .clk   (internal_clk), 
     .clr   (rst), 
     .up    (up), 
     .ld    (rco_out || rst_cnt), 
     .D     ({4{1'b0}}), 
     .count (r_addr), 
     .rco   (rco_out)); 
          
   ram_single_port #(.n(5),.m(16)) my_ram (
      .data_in  (rca_out),  // m spec
      .addr     (r_addr),  // n spec 
      .we       (we),
      .clk      (internal_clk ),
      .data_out (ram_dout)
      );  
          
    logic is_valid;
    univ_sseg my_univ_sseg (
     .cnt1    (ram_dout[13:0]), 
     .cnt2    (), 
     .valid   (is_odd), //HIGH to show decimal value 
     .dp_en   (0), 
     .dp_sel  (2'b00), 
     .mod_sel (2'b10), 
     .sign    (0), 
     .clk     (clk), 
     .ssegs   (seg), 
     .disp_en (an)); 
     
   fibFSM my_FSM (.reset_n(rst), .go(go), .is_odd(is_odd), .rco(rco_out), .clk(internal_clk), .load(load), .enable(enable), .we(we), .up(up), .rst_cnt(rst_cnt), .valid(is_valid)); 
    
endmodule
