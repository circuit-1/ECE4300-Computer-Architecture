`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 10:00:30 AM
// Design Name: 
// Module Name: mux
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


module mux(
            input [31:0] in_0,
            input [31:0] in_1,
            input sel,
            output [31:0] out
        );
        
    assign out = sel ? in_1 : in_0; // if sel = 1, out = in_1        
        
        
endmodule
