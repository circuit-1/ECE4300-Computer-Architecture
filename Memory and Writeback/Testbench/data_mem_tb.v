`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2026 12:21:30 PM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb();

        reg clk_tb = 1; 
        reg [31:0] addr_tb, write_data_tb; 
        reg mem_read_tb, mem_write_tb; 
        wire [31:0] read_data_tnb; 
        
        
        data_mem DATA_MEM_TB (
                    .clk(clk_tb),
                    .addr(addr_tb),
                    .write_data(write_data_tb),
                    .mem_read(mem_read_tb),
                    .mem_write(mem_write_tb),
                    .read_data(read_data_tnb)
                    );
        always 
            #5 clk_tb = ~clk_tb; 
        
        initial 
            begin 
                addr_tb = 32'h57; 
                write_data_tb = 32'h87; 
                mem_read_tb = 1; 
                mem_write_tb = 0; 
             #50
                mem_write_tb = 1; 
                mem_read_tb = 0; 
             #50 
                addr_tb = 32'h389; 
                write_data_tb = 32'h158; 
             #50 
                mem_write_tb = 1; 
                mem_read_tb = 1; 
             #50
                addr_tb = 32'h2;
                mem_write_tb = 0;                
            #100
                $finish;
            end 
                        
                    
                    
        
endmodule
