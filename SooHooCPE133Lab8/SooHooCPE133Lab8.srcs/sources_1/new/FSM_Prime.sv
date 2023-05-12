`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/13/2021 08:28:25 PM
// Module Name: FSM_Prime
// Project Name: Project 8
//////////////////////////////////////////////////////////////////////////////////


module FSM_Prime(
    input DIN,
    input CLK,
    input RST,
    output DOUT);
    
    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10,
              D = 2'b11;
              
    logic [1:0] current_state;
    logic outVal;
    
    always@(posedge CLK or posedge RST) begin
        if(RST) begin
            outVal <= 1'b0;
            current_state = A;
        end
        else begin
            case(current_state)
                A : begin
                    if(DIN) current_state <= B;
                    outVal <= 1'b0;    
                end
                B : begin
                    if(~DIN) current_state <= C;
                    outVal <= 1'b0;
                end
                C: begin
                    if(DIN) current_state <= D;
                    else current_state <= A;
                    outVal <= 1'b0;
                end
                D : begin
                    if(DIN) begin
                        current_state <= B;
                        outVal <= 1'b1;
                    end else begin
                        current_state <= C;
                        outVal <= 1'b0;
                    end
                end
            endcase
        end
    end
    
    assign DOUT = outVal;
endmodule
