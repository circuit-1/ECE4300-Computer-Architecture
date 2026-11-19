`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2026 11:28:43 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
        
        reg clk_tb = 1; 
        reg reset_tb = 0;
        reg [31:0] pc_in_tb;
        wire [31:0] pc_out_tb;
        
         pc PC_TB (
                    .clk(clk_tb),
                    .reset(reset_tb),
                    .pc_in(pc_in_tb),
                    .pc_out(pc_out_tb)
                );
                
         always
            #5 clk_tb = ~clk_tb; 
         
         
         initial 
            begin 
                pc_in_tb = 32'h64; 
            #100
                pc_in_tb = 32'h32;
            #100
                pc_in_tb = 32'h1243;
            #500
            $finish;           
            end       

endmodule
