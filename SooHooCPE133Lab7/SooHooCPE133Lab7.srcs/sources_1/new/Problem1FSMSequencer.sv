`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 03/07/2021 08:17:44 PM
// Module Name: Problem1FSMSequencer
//////////////////////////////////////////////////////////////////////////////////


module Problem1FSMSequencer(
    input EIN,
    input RST,
    input CLK,
    input [15:0] SWITCHES,
    output [15:0] LED_SIG //was reg
    );
    
    logic [15:0] fsm_out; //was reg
    logic current_pulse, current_dff; //was reg
    logic [3:0] counter_bus=4'b0000, clock_counter=4'b0000; //was reg
    logic clkdiv;
    
    initial begin
        clkdiv = 1'b0;
    end
    
    always@(posedge CLK or posedge RST) begin
        clock_counter <= RST ? 4'b0000 : (EIN==1'b1) ? (clock_counter + 1'b1) : clock_counter;
        clkdiv = (clock_counter == 4'b1111) ? ~clkdiv : clkdiv;
    end
    
    always@(posedge clkdiv or posedge RST) begin
        counter_bus <= RST ? 4'b0000 : counter_bus + 1'b1;
        current_pulse = (counter_bus == 4'b0000) ? SWITCHES[0] : current_pulse;
        current_pulse = (counter_bus == 4'b0001) ? SWITCHES[1] : current_pulse;
        current_pulse = (counter_bus == 4'b0010) ? SWITCHES[2] : current_pulse;
        current_pulse = (counter_bus == 4'b0011) ? SWITCHES[3] : current_pulse;
        current_pulse = (counter_bus == 4'b0100) ? SWITCHES[4] : current_pulse;
        current_pulse = (counter_bus == 4'b0101) ? SWITCHES[5] : current_pulse;
        current_pulse = (counter_bus == 4'b0110) ? SWITCHES[6] : current_pulse;
        current_pulse = (counter_bus == 4'b0111) ? SWITCHES[7] : current_pulse;
        current_pulse = (counter_bus == 4'b1000) ? SWITCHES[8] : current_pulse;
        current_pulse = (counter_bus == 4'b1001) ? SWITCHES[9] : current_pulse;
        current_pulse = (counter_bus == 4'b1010) ? SWITCHES[10] : current_pulse;
        current_pulse = (counter_bus == 4'b1011) ? SWITCHES[11] : current_pulse;
        current_pulse = (counter_bus == 4'b1100) ? SWITCHES[12] : current_pulse;
        current_pulse = (counter_bus == 4'b1101) ? SWITCHES[13] : current_pulse;
        current_pulse = (counter_bus == 4'b1110) ? SWITCHES[14] : current_pulse;
        current_pulse = (counter_bus == 4'b1111) ? SWITCHES[15] : current_pulse;
        
        fsm_out[15] = (counter_bus == 4'b0000) ? current_dff : fsm_out[15];
        fsm_out[0] = (counter_bus == 4'b0001) ? current_dff : fsm_out[0];
        fsm_out[1] = (counter_bus == 4'b0010) ? current_dff : fsm_out[1];
        fsm_out[2] = (counter_bus == 4'b0011) ? current_dff : fsm_out[2];
        fsm_out[3] = (counter_bus == 4'b0100) ? current_dff : fsm_out[3];
        fsm_out[4] = (counter_bus == 4'b0101) ? current_dff : fsm_out[4];
        fsm_out[5] = (counter_bus == 4'b0110) ? current_dff : fsm_out[5];
        fsm_out[6] = (counter_bus == 4'b0111) ? current_dff : fsm_out[6];
        fsm_out[7] = (counter_bus == 4'b1000) ? current_dff : fsm_out[7];
        fsm_out[8] = (counter_bus == 4'b1001) ? current_dff : fsm_out[8];
        fsm_out[9] = (counter_bus == 4'b1010) ? current_dff : fsm_out[9];
        fsm_out[10] = (counter_bus == 4'b1011) ? current_dff : fsm_out[10];
        fsm_out[11] = (counter_bus == 4'b1100) ? current_dff : fsm_out[11];
        fsm_out[12] = (counter_bus == 4'b1101) ? current_dff : fsm_out[12];
        fsm_out[13] = (counter_bus == 4'b1110) ? current_dff : fsm_out[13];
        fsm_out[14] = (counter_bus == 4'b1111) ? current_dff : fsm_out[14];
        fsm_out = RST ? {16{1'b0}} : fsm_out;
    end
    
    FSMSequencer SEQUENCER (.pulse(current_pulse), .clk(clkdiv), .rst(RST), .value(current_dff));
    
    assign LED_SIG = fsm_out;
endmodule
