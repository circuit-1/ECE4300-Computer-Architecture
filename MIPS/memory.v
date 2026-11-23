`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 12:01:57 PM
// Design Name: 
// Module Name: memory
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


module memory(
            input clk_top,
            input [1:0] wb_ctlout,
            input m_ctlout, zero_in, mem_read_in, mem_write_in, 
            input [31:0] alu_result, read_data2_ex_mem,
            input [4:0] FiveBitMuxout, 
            output [31:0] read_data_top, mem_alu_result_top, WriteData_top,
            output RegWrite, MemToReg_top, PCSrs_out,
            output [4:0] MemWriteReg
            );
            
            wire [31:0] read_data_out;
            
            and_memory AND_MEMORY (
                .membranch(m_ctlout),
                .zero(zero_in),
                .PCSrc(PCSrs_out)
                    ); 
                    
            mux_memory MUX_MEMORY (
                .MemToReg(MemToReg_top),
                .ReadData_in(read_data_top),
                .MemAlu_in(mem_alu_result_top),
                .WriteData(WriteData_top)
                ); 
                     
           data_memory DATA_MEMORY (
                .clk(clk_top),
                .addr(alu_result),
                .write_data(read_data2_ex_mem),
                .mem_read(mem_read_in),
                .mem_write(mem_write_in),
                .read_data(read_data_out)
                );
            
             mem_wb MEM_WB_MEMORY (
                .clk(clk_top),
                .control_wb_in(wb_ctlout),
                .read_data_in(read_data_out), 
                .alu_result_in(alu_result),
                .write_reg_in(FiveBitMuxout), // FiveBitMuxout
                .regwrite(RegWrite), 
                .memtoreg(MemToReg_top), //1 bit wire
                .read_data(read_data_top), 
                .mem_alu_result(mem_alu_result_top),
                .mem_write_reg(MemWriteReg)
                );         
endmodule
