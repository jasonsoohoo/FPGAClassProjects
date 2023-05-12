`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/08/2021 12:24:04 AM
// Module Name: FSMSequencer
//////////////////////////////////////////////////////////////////////////////////


module FSMSequencer(
    input pulse,
    input clk,
    input rst,
    output value
    );
    
    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;
    localparam D = 2'b11;
    
    logic [1:0] state, next_state;
    logic out_val;
    
    initial begin
        state = A;
    end
    
    always@(posedge clk or posedge rst) begin
        state = next_state;
        state = rst ? A : state;
    end
    
    always@(negedge clk) begin
        next_state = pulse ? state==A ? B : state==B ? B : state==C ? D : B : next_state;
        next_state = ~pulse ? state==A ? A : state==B ? C : state==C ? A : C : next_state;
        out_val = state===2'b11 ? (pulse ? 1'b1 : 1'b0) : 1'b0;
    end
    
    assign value = out_val;    
endmodule
