`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 09:26:41 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input clk, input reset, output [31:0] Dout);
	wire [31:0] ALUout;
    wire [31:0]Cout;
    wire [31:0]Cin;
    wire [31:0]Inst_out,S,T;
    wire [3:0]ALUCntl;
    wire RegWrite,C,N,Z,V;
    wire [4:0] wr;
    wire [1:0] br;
    wire RegDst;
    wire mr;
    wire mtr;
    wire mw;
    wire ALUSrc;
    wire [31:0] ALUin;
    wire [31:0] SEval;
    wire [31:0] rd;
    wire [31:0] shl2;
    wire [31:0] Co4;
    
ProgramCounter pc(.clk(clk),.reset(reset),.Din(Cin),.Dout(Cout));
	assign Co4 = Cout + 3'd4;

    ShiftLeftTwo sll(.in(SEval), .out(shl2));
    Mux32x1 adder(.zero(Co4), .one(shl2 + Co4), .ctrl(br[0] & Z | br[1] & ~Z), .out(Cin));


Instruction_Memory imem(.Addr(Cout),.Inst_out(Inst_out));

Mux4x1 m(.zero(Inst_out[20:16]), .one(Inst_out[15:11]), .ctrl(RegDst), .out(wr));

    regfile32 rf32(.clk(clk),.reset(reset),.D_En(RegWrite),.D_Addr(wr),
            .S_Addr(Inst_out[25:21]),.T_Addr(Inst_out[20:16]), .D(Dout),.S(S),.T(T) ); 
            
            SignExtend se(.in(Inst_out[15:0]), .out(SEval));  
                 
    Control cntl(.Op(Inst_out[31:26]),.Func(Inst_out[5:0]), .ALUCntl(ALUCntl), .RegWrite(RegWrite),
    .Branch(br), .MemRead(mr), .MemToReg(mtr), .MemWrite(mw), .ALUSrc(ALUSrc), .RegDst(RegDst));
    
    Mux32x1 e(.zero(T), .one(SEval), .ctrl(ALUSrc), .out(ALUin));
    
    ALU alu(.A(S),.B(ALUin),.ALUCntl(ALUCntl),.ALUout(ALUout),.C(C),.N(N),.Z(Z),.V(V));
    
    DataMem d(.clk(clk), .addr(ALUout), .wr_data(T), .mem_wr(mw), .mem_rd(mr), .rd_data(rd));
    
    Mux32x1 dMux(.one(rd), .zero(ALUout), .ctrl(mtr), .out(Dout));
endmodule
