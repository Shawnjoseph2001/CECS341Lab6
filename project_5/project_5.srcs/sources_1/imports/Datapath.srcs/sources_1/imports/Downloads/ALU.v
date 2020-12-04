`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/22 08:23:26
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCntl,
    output reg [31:0] ALUout,
    output reg C,
    output reg N,
    output Z,
    output reg V
    );
    
    reg signed [31:0]A_s,B_s;
    assign Z = (ALUout == 32'b0)?1'b1:1'b0;
    
    always@(*)begin
        A_s = A;
        B_s = B;
        case(ALUCntl)
            4'b1010:begin                           //add
                        {C,ALUout} = A_s + B_s;
                        if((A_s[31] & B_s[31] & ~ALUout[31])||(~A_s[31] & ~B_s[31] & ALUout[31]))//If a is pos,b is pos and  result is neg, Or vice visa
                            V = 1'b1;
                        else 
                            V = 1'b0;
                        N = ALUout[31];            
                    end
            4'b1110:begin                           //Sub
                        {C,ALUout} = A_s - B_s;
                        if((A_s[31] & ~B_s[31] & ~ALUout[31])||(~A_s[31] & B_s[31] & ALUout[31]))
                            V = 1'b1;
                            else 
                            V = 1'b0;
                        N = ALUout[31];   
                    end
            4'b0010:begin                             //add Unsigned
                        {C,ALUout} = A + B;
                        V = C;
                        N = 1'b0;
                    end
            4'b0110:begin                             //Sub Unsigned
                        {C,ALUout} = A - B;
                        V = C;
                        N = 1'b0;
                    end
            4'b0000:begin                           //And
                        {V,C,ALUout} = {2'bx,(A&B)};
                        N = ALUout[31];
                    end
            4'b0001:begin                           //Or
                        {V,C,ALUout} = {2'bx,(A|B)};
                        N = ALUout[31];
                    end
            4'b0011:begin                           //XOr
                        {V,C,ALUout} = {2'bx,(A^B)};
                        N = ALUout[31];
                    end
            4'b1100:begin                           //Nor
                        {V,C,ALUout} = {2'bx,~(A|B)};
                        N = ALUout[31];
                    end
            4'b0111:begin                           //Not
                        {V,C,ALUout} = {2'bx,~(A)};
                        N = ALUout[31];
                    end
            4'b1101:begin                           //Not
                        {C,ALUout} = {(A)<<1};
                        V = 1'bx;
                        N = ALUout[31];
                    end
            4'b1111:begin //SLT
            			C = 0;
            			V = 0;
            			N = 0;
            			if(A[31] & ~B[31])
            			ALUout = 0;
            			else if(B[31] & ~A[31])
            			ALUout = 32'hFFFFFFFF;
            			else if(~B[31] & ~A[31])
            			begin
            			if(A > B)
            			ALUout = 32'hFFFFFFFF;
            			else
            			ALUout = 0;
            			end
            			else
            			begin
            			if(A < B)
            			ALUout = 32'hFFFFFFFF;
            			else
            			ALUout = 0;
            			end
            		end
            4'b0100: begin //SLTU
            			C = 0;
            			V = 0;
            			N = 0;
            			if(A > B)
            			ALUout = 32'hFFFFFFFF;
            			else
            			ALUout = 0;
            		end
            default: begin
            		C = 0;
            		N = 0;
            		V = 0;
            		ALUout = 0;
            		//$display("Error in ALU!");
            	end
       endcase
    end
endmodule
