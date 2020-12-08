`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 08:19:07 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Op,
    input [5:0] Func,
    output reg RegDst, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump,
    output reg [1:0] Branch,
    output reg [3:0] ALUCntl
    );
    
    always @(*) begin
    case(Op)
    6'b0:begin
    RegWrite <= 1'b1;
    RegDst <= 1'b1;
    Branch <= 2'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    MemWrite <= 1'b0;
    ALUSrc <= 1'b0;
    Jump <= 1'b0;
    case(Func)
    6'h20:begin //add
    ALUCntl <= 4'b1010;
    end
    6'h21:begin //addu
    ALUCntl <= 4'b0010;
    end
    6'h22:begin //sub
    ALUCntl <= 4'b1110;
    end
    6'h23:begin //subu
    ALUCntl <= 4'b0110;
    end
    6'h24:begin //and
    ALUCntl <= 4'b0000;
    end
    6'h25:begin //or
    ALUCntl <= 4'b0001;
    end
    6'h26:begin //xor
    ALUCntl <= 4'b0011;
    end
    6'h27:begin //nor
    ALUCntl <= 4'b1100;
    end
    6'h2A:begin //SLT
    ALUCntl <= 4'b1111;
    end
    6'h2B:begin //SLTU
    ALUCntl <= 4'b0100;
    end
    default:begin //invalid code
    //$display("Error! Check control file");
    end
    endcase
    end
    6'h08:begin //addi
    RegWrite <= 1'b1;
    Branch <= 2'b0;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b1010;
    ALUSrc <= 1'b1;
        Jump <= 1'b0;
    end
    6'h09:begin //addiu
        Branch <= 2'b0;
        RegWrite <= 1'b1;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b0010;
    ALUSrc <= 1'b1;
    end
    6'h0C:begin //And immediate
    RegWrite <= 1'b1;
        Branch <= 2'b0;    
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b0000;
    ALUSrc <= 1'b1;
        Jump <= 1'b0;
    end
    6'h0D:begin //Ori
    RegWrite <= 1'b1;
        Branch <= 2'b0;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUSrc <= 1'b1;
    MemWrite <= 1'b0;
    ALUCntl <= 4'b0001;
    Jump <= 1'b0;
    end
    6'h23:begin //lw
        Branch <= 2'b0;
    RegDst <= 1'b0;
    RegWrite <= 1'b1;
    ALUSrc <= 1'b1;
    ALUCntl <= 4'b1010;
    MemWrite <= 1'b0;
    MemRead <= 1'b1;
    MemToReg <= 1'b1;
    Jump <= 1'b0;
    end
    6'h2B:begin //sw
        Branch <= 2'b0;
    RegDst <= 1'b0;
    RegWrite <= 1'b0;
    ALUSrc <= 1'b1;
    ALUCntl <= 4'b1010;
    MemWrite <= 1'b1;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    Jump <= 1'b0;
    end
    6'h04:begin //beq
    RegDst <= 1'b0;
    Branch <= 2'b01;
    RegWrite <= 1'b0;
    ALUCntl <= 4'b1110;
    ALUSrc <= 1'b0;
    MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    Jump <= 1'b0;
    end
    6'h05:begin //bne
    RegDst <= 1'b0;
    Branch <= 2'b10;
    RegWrite <= 1'b0;
    ALUCntl <= 4'b1110;
    ALUSrc <= 1'b0;
    MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    Jump <= 1'b0;
    end
    6'h0A:begin //slti
    Branch <= 2'b0;
    RegWrite <= 1'b1;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b1111;
    ALUSrc <= 1'b1;
    Jump <= 1'b0;
    end
    6'h0B:begin //sltiu
    Branch <= 2'b0;
    RegWrite <= 1'b1;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b0100;
    ALUSrc <= 1'b1;
    Jump <= 1'b0;
    end
    
    6'h2:begin //jump
    Branch <= 2'b11;
    RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b1110;
    ALUSrc <= 1'b0;
    Jump <= 1'b1;
    end
    
    default:begin
        Branch <= 2'b0;
    RegWrite <= 1'b0;
        MemWrite <= 1'b0;
    MemRead <= 1'b0;
    MemToReg <= 1'b0;
    RegDst <= 1'b0;
    ALUCntl <= 4'b0100;
    ALUSrc <= 1'b1;
    Jump <= 1'b0;
    $display("Error! check control file");
    end
    endcase
    end
endmodule
