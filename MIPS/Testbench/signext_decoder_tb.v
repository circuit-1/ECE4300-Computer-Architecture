`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2026 10:15:28 AM
// Design Name: 
// Module Name: signext_decoder_tb
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


module signext_decoder_tb();

         reg [15:0] immediate_tb;
         wire [31:0] extended_tb;
         
         signext_decoder SIGNEXT_DECODER_TB (
                .immediate(immediate_tb),
                .extended(extended_tb)
              );
         
         initial
            begin 
                immediate_tb = 16'h1024; 
             #50
                immediate_tb = 16'h355;
             #50
                immediate_tb = -16'h983;
             #100
             $finish;
            end     
              
endmodule
