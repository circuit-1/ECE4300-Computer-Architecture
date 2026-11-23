`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 11:26:37 AM
// Design Name: 
// Module Name: and_memory_tb
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


module and_memory_tb();

        reg membranch_tb, zero_tb; 
        wire PCSrc_tb; 

        and_memory AND_MEMORY_TB (
                    .membranch(membranch_tb),
                    .zero(zero_tb),
                    .PCSrc(PCSrc_tb)
                    );
        
        initial 
            begin 
                membranch_tb = 1'b1; 
                zero_tb = 1'b1;
             #50
                membranch_tb = 1'b0; 
             #50 
                membranch_tb = 1'b1; 
                zero_tb = 1'b0;
             #50 
                membranch_tb = 1'b0;
             #100
                $finish;
            end
endmodule
