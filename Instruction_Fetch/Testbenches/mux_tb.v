`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 10:03:46 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();

     reg [31:0] in_0_tb, in_1_tb; 
     reg sel_tb; 
     wire [31:0] out_tb;
     
     mux TB(
            .in_0(in_0_tb),
            .in_1(in_1_tb),
            .sel(sel_tb),
            .out(out_tb)
        );
        
     initial 
        begin 
            in_0_tb = 32'd35; 
            in_1_tb = 32'd234; 
            sel_tb = 1; 
         #50 
            sel_tb = 0; 
            in_1_tb = 32'd22; 
         #50 
            sel_tb = 1; 
         $finish;
        end
         
        
endmodule
