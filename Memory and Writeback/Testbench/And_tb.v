`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2026 06:52:49 AM
// Design Name: 
// Module Name: And_tb
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


module And_tb();
        
        reg membranch_tb, zero_tb; 
        wire PCSrc_tb; 

        And AND_TB (
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
