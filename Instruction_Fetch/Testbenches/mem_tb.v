`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 12:15:40 PM
// Design Name: 
// Module Name: mem_tb
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


module mem_tb();

        reg clk_tb = 1;
        reg reset_tb = 0;
        reg [31:0] addr_tb; 
        wire [31:0] data_tb; 
        
        mem MEM_TB (
                    .clk(clk_tb),
                    .reset(reset_tb),
                    .addr(addr_tb), 
                    .data(data_tb)
                );
        
        
        
        always 
            #5 clk_tb = ~clk_tb; 
            
        initial 
            begin 
                addr_tb = 32'h1; 
             #50
                addr_tb = 32'h12;
             #50 
                addr_tb = 32'h5; 
             #50 
                addr_tb = 32'h8; 
             #50 
                addr_tb = 32'h123;
             $finish;
            end
        
endmodule
