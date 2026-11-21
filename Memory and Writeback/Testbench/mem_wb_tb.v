`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2026 07:56:50 AM
// Design Name: 
// Module Name: mem_wb_tb
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


module mem_wb_tb();
        
        reg clk_tb = 1'b1; 
        reg [1:0] control_wb_in_tb;
        reg [31:0] read_data_in_tb, alu_result_in_tb; 
        reg [4:0] write_reg_in_tb; 
        wire regwrite_tb, memtoreg_tb; 
        wire [31:0] read_data_tb, mem_alu_result_tb; 
        wire [4:0] mem_write_reg_tb; 
        
        
         mem_wb MEM_WB_TB (
                .clk(clk_tb),
                .control_wb_in(control_wb_in_tb),
                .read_data_in(read_data_in_tb), 
                .alu_result_in(alu_result_in_tb),
                .write_reg_in(write_reg_in_tb), // FiveBitMuxout
                .regwrite(regwrite_tb), 
                .memtoreg(memtoreg_tb), //1 bit wire
                .read_data(read_data_tb),
                .mem_alu_result(mem_alu_result_tb),
                .mem_write_reg(mem_write_reg_tb)
                );
                
            always 
                begin 
                    #5 clk_tb = ~clk_tb; 
                end
            
            initial 
                begin 
                    control_wb_in_tb = 2'b00; 
                    read_data_in_tb = 32'h1827; 
                    alu_result_in_tb = 32'h14; 
                    write_reg_in_tb = 5'h8; 
                #50
                    control_wb_in_tb = 2'b10;
                    read_data_in_tb = 32'h634;
                    alu_result_in_tb = 32'h536; 
                    write_reg_in_tb = 5'h12; 
                #50 
                    control_wb_in_tb = 2'b01; 
                    read_data_in_tb = 32'h638; 
                    alu_result_in_tb = 32'h538; 
                    write_reg_in_tb = 5'h16; 
               #100
                    $finish;                 
                end          
                
endmodule
