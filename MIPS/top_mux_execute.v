`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:25:41 PM
// Design Name: 
// Module Name: top_mux_execute
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


module top_mux_execute(
            input [31:0] a, // ReadData2
            input [31:0] b, // SignExtend
            output [31:0] y,
            input alusrc
            );
            
        assign y = alusrc ? b : a; 
        
endmodule
