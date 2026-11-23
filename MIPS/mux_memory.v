`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 11:28:08 AM
// Design Name: 
// Module Name: mux_memory
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


module mux_memory(
            input MemToReg,
            input [31:0] ReadData_in,
            input [31:0] MemAlu_in,
            output [31:0] WriteData
            );
       
        assign WriteData = MemToReg ? ReadData_in : MemAlu_in;   
endmodule
