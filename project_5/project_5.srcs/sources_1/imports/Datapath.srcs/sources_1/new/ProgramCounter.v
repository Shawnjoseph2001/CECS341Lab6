`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 08:19:07 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
	input clk,
    input reset,
    input [31:0] Din,
    output reg[31:0] Dout
    );
    always @(posedge clk) begin
    	if(reset)
    		Dout = 0;
    	else
    		Dout = Din;
    	end
endmodule
