`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Jason SooHoo
// 
// Create Date: 04/26/2021 08:33:33 PM
// Design Name: ALU Implementation
// Module Name: alu_unit
// Project Name: RISC-V Building
// Target Devices: Basys-3
// Tool Versions: 
// Description: ALU unit to perform operations for RISC-V Instruction Set
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_unit(
    input [31:0] OP_1,
    input [31:0] OP_2,
    input [3:0] alu_fun,
    output logic [31:0] RESULT
    );
    
    parameter _add = 4'b0000,
              _sub = 4'b1000,
              _or = 4'b0110,
              _and = 4'b0111,
              _xor = 4'b0100,
              _srl = 4'b0101,
              _sll = 4'b0001,
              _sra = 4'b1101,
              _slt = 4'b0010,
              _sltu = 4'b0011,
              _lui = 4'b1001,
              _unspecified = 4'b1111;
    
    always @ (OP_1, OP_2, alu_fun) begin
        case(alu_fun)
        _add: RESULT = OP_1 + OP_2;
        _sub: RESULT = OP_1 - OP_2;
        _or: RESULT = OP_1 | OP_2;
        _and: RESULT = OP_1 & OP_2;
        _xor: RESULT = OP_1 ^ OP_2;
        _srl: RESULT = OP_1 >> OP_2[4:0];
        _sll: RESULT = OP_1 << OP_2[4:0];
        _sra: RESULT = $signed(OP_1) >>> OP_2[4:0];
        _slt: RESULT =  $signed(OP_1) < $signed(OP_2);
        _sltu: RESULT = OP_1 < OP_2;
        _lui: RESULT = OP_1;
        _unspecified: RESULT = 'h0xDEADBEEF;
        default: RESULT = 0;
        endcase
    end
endmodule
