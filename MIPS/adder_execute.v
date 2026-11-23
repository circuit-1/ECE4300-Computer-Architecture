`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:23:24 PM
// Design Name: 
// Module Name: adder_execute
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


module adder_execute(
            input [31:0] add_in1,
            input [31:0] add_in2,
            output [31:0] add_out
            );
        // it will discard the leftmost bit which is 33rd bit.     
        assign add_out = add_in1 + add_in2;        
            
endmodule
