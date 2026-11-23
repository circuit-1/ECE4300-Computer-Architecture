`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 12:08:54 PM
// Design Name: 
// Module Name: memory_tb
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


module memory_tb();

        reg clk_tb = 1; 
        reg [1:0] wb_ctlout_tb; 
        wire RegWrite_tb, MemToReg_tb;
        
        reg m_ctlout_tb, zero_in_tb;
        wire PCSrs_tb;
        
        reg mem_read_in_tb, mem_write_in_tb; 
        reg [31:0] alu_result_tb, read_data2_ex_mem_tb; 
        
        wire [31:0] read_data_tb, mem_alu_result_tb, write_data_tb; 
        
        reg [4:0] FiveBitMuxout_tb; 
        wire [4:0] MemWriteReg_tb;

        memory MEMORY_TB (
                    .clk_top(clk_tb),
                    
                    .wb_ctlout(wb_ctlout_tb),
                    .RegWrite(RegWrite_tb), 
                    .MemToReg_top(MemToReg_tb), 
                    
                    .m_ctlout(m_ctlout_tb), 
                    .zero_in(zero_in_tb), 
                    .PCSrs_out(PCSrs_tb),
                    
                    .mem_read_in(mem_read_in_tb), 
                    .mem_write_in(mem_write_in_tb), 
                    .alu_result(alu_result_tb), 
                    .read_data2_ex_mem(read_data2_ex_mem_tb), // Write Data input
                    
                    .read_data_top(read_data_tb), // output Read_Data2
                    .mem_alu_result_top(mem_alu_result_tb), 
                    .WriteData_top(write_data_tb), // output mux
                    
                    .FiveBitMuxout(FiveBitMuxout_tb), 
                    .MemWriteReg(MemWriteReg_tb)
                    );
      
        always 
            #5 clk_tb = ~clk_tb; 
        
        initial 
            begin 
                wb_ctlout_tb = 2'b10; 
                m_ctlout_tb = 1; 
                zero_in_tb = 0; 
                alu_result_tb = 32'h62; 
                read_data2_ex_mem_tb = 32'h17; 
                mem_read_in_tb = 1; 
                mem_write_in_tb = 1; 
                FiveBitMuxout_tb = 5'b01101; 
             #50
                wb_ctlout_tb = 2'b00; 
                zero_in_tb = 1; 
             #50 
                alu_result_tb = 32'h5; 
                mem_write_in_tb = 0; 
                m_ctlout_tb = 0; 
             #50 
                wb_ctlout_tb = 2'b11; 
                alu_result_tb = 32'h70; 
                mem_write_in_tb = 1; 
                read_data2_ex_mem_tb = 32'h89; 
             #50
                alu_result_tb = 32'h62;
                FiveBitMuxout_tb = 5'b01010;
                m_ctlout_tb = 1;
             #50 
                alu_result_tb = 32'h4; 
                mem_write_in_tb = 0; 
             #50 
                wb_ctlout_tb = 2'b01; 
                alu_result_tb = 32'h70; 
             #100
                $finish; 
            end              
                    
endmodule
