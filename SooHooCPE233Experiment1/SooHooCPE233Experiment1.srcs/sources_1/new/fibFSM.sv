`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 10:26:35 PM
// Design Name: 
// Module Name: fibFSM
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


module fibFSM(reset_n, go, is_odd, rco, clk, load, enable, we, up, rst_cnt, valid); 
    input  reset_n, go, is_odd, rco, clk; 
    output logic load, enable, we, up, rst_cnt, valid;
     
    logic [2:0] NS, PS; 
    parameter [1:0] st_DISP=3'b000, st_LOAD_0=3'b01, st_LOAD_1=3'b010, st_ODD=3'b011, st_NODD=3'b111; 
    

    //- model the state registers
    always @ (negedge reset_n, posedge clk)
       if (reset_n == 0) 
          PS <= st_DISP; 
       else
          PS <= NS; 
    
    //- model the next-state and output decoders
    always @ (go, is_odd, rco, PS)
    begin
       load = 0; enable=0; we=0; up=1; rst_cnt=0; valid=1;
       case(PS)
          st_DISP:
          begin
             if (go == 1)
             begin
                NS = st_LOAD_0; 
             end  
             else
             begin
                NS = st_DISP; 
             end  
          end
          
          st_LOAD_0:
          begin
          load = 0; enable=0; we=1; up=0; rst_cnt=1; valid=0;
          NS = st_LOAD_1;
          end   
             
          st_LOAD_1:
          begin
          load = 1; enable=1; we=1; up=1; rst_cnt=0; valid=0;
                 if (is_odd == 1)
                 begin
 
                    NS = st_ODD; 
                 end  
                 else
                 begin
                    NS = st_NODD; 
                 end  
             end
             
          st_ODD:
          begin
          load = 0; enable=1; we=1; up=1; rst_cnt=0; valid=0;
                 if (is_odd == 1 && rco == 0)
                 begin NS = st_ODD; end
                 else if(rco == 1)
                 begin NS = st_DISP; end
                 else begin NS = st_NODD; end 
          end
             
          st_NODD:
          begin
          load = 0; enable=1; we=0; up=0; rst_cnt=0; valid=0;
                 if (is_odd == 1)
                 begin NS = st_ODD; end  
                 else begin NS = st_NODD; end  
          end
          default: NS = st_DISP; 
            
          endcase
      end              
endmodule
