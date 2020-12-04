`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 08:43:18 AM
// Design Name: 
// Module Name: Mux4x1
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


module Mux4x1(
    input [4:0] zero,
    input [4:0] one,
    input ctrl,
    output reg [4:0] out
    );
    always @(zero or one or ctrl) begin
    case(ctrl)
    1'b0: out <= zero;
    1'b1: out <= one;
    //default: $display("Error in Mux4x1");
    endcase
    end
endmodule
