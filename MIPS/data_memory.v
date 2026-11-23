`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 11:48:21 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
            input clk,
            input [31:0] addr,
            input [31:0] write_data,
            input mem_read,
            input mem_write,
            output reg [31:0] read_data = 32'h0
            );
        reg [31:0] DMEM [0:255]; // 32-bit per word and there is the depth of 256 words
            
        // Verilog will read hex values stored in Data.txt
        initial 
            begin 
                $readmemh("data.txt", DMEM);
            end    
                      
        always @(*) 
            begin 
                if (mem_read)
                    read_data <= DMEM[addr[7:0]]; // 256 words, 2^8 = 256
                if (mem_write)
                    DMEM[addr[7:0]] <= write_data; // write data into a specific location
            end      
            
endmodule
