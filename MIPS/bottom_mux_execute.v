`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:29:01 PM
// Design Name: 
// Module Name: bottom_mux_execute
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


module bottom_mux_execute(
            input [4:0] a,
            input [4:0] b,
            input sel,
            output [4:0] y
            );
        
        assign y = sel ? b : a; 
                             
endmodule
