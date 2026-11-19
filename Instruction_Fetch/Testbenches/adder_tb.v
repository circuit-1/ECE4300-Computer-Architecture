`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 09:44:47 AM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    reg clk_tb = 1;
    reg reset_tb = 0;
    reg [31:0] pcin_tb; 
    wire [31:0] pcout_tb; 

    adder TB (
                .clk(clk_tb),
                .reset(reset_tb),
                .pcin(pcin_tb),
                .pcout(pcout_tb)
            );
            
    initial 
        begin 
            pcin_tb = 32'd0; 
        #100
            pcin_tb = 32'd9;
        #100
            $finish;            
        end       
            
            
endmodule
