`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/13/2021 08:28:25 PM
// Module Name: Problem1SequenceDetectorPlus
// Project Name: Project 8
//////////////////////////////////////////////////////////////////////////////////


module Problem1SequenceDetectorPlus(
    input [15:0] DIN,
    input EIN,
    input CLK,
    input RST,
    output logic [15:0] DOUT
    );
    
    logic div_clk;
    logic secondary_enable, active_pulse, out0, out1;
    
    logic [15:0] disabled_bits;
    
    logic [3:0] cur_bit0, cur_bit1, cur_bit2, cur_bit3; 
    
    clk_wiz_0 clock_divider (.clk_in1(CLK), .reset(RST), .clk_out1(div_clk));
    
    FSM_Prime primary_fsm (.DIN(active_pulse), .CLK(div_clk), .RST(RST), .DOUT(out0));
    FSM_Secondary secondary_fsm (.DIN(active_pulse), .CLK(div_clk), .RST(secondary_enable), .DOUT(out1));
    
    always@(posedge div_clk or posedge RST) begin
        if (RST) begin
            cur_bit0 <= 4'b0011;
            cur_bit1 <= 4'b0010;
            cur_bit2 <= 4'b0001;
            cur_bit3 <= 4'b0000;
        end else begin
            active_pulse <= DIN[cur_bit0];
            if (EIN) begin
                cur_bit0 += 1;
                cur_bit1 += 1;
                cur_bit2 += 1;
                cur_bit3 += 1;
            end
        end
    end
    
    //DISABLES OVERLAP INTO NEXT FSM BUT ALSO MAKES SURE THAT SECONDARY REMAINS ENABLED IF ATLEAST 1 is active
    always@(posedge RST or negedge div_clk) begin
        if(RST) begin
            disabled_bits <= {16{1'b0}};
            secondary_enable <= 1'b0;
        end else begin
            if (disabled_bits[cur_bit0]) begin
                secondary_enable <= 1'b1;
                disabled_bits[cur_bit0] <= 1'b0;
            end else secondary_enable <= 1'b0;
            if(out0) begin
                disabled_bits[cur_bit0 - 1] <= 1'b1;
                disabled_bits[cur_bit1 - 1] <= 1'b1;
                disabled_bits[cur_bit2 - 1] <= 1'b1;
                disabled_bits[cur_bit3 - 1] <= 1'b1;
            end
        end
    end
    
    //The update to the register will be off by two clock edges
    always@(posedge RST or negedge div_clk) begin
        if (RST) DOUT <= {16{1'b0}};
        else begin
            if(out1 && !secondary_enable && |disabled_bits) DOUT[cur_bit2] <= 1'b1;
            else DOUT[cur_bit2] <= 1'b0;
        end
    end
endmodule
