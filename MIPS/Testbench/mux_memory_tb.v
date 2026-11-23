`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 11:28:38 AM
// Design Name: 
// Module Name: mux_memory_tb
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


module mux_memory_tb();



        reg MemToReg_tb;
        reg [31:0] ReadData_in_tb, MemAlu_in_tb;
        wire [31:0] WriteData_tb; 


        mux_memory MUX_MEMORY_TB (
                    .MemToReg(MemToReg_tb),
                    .ReadData_in(ReadData_in_tb),
                    .MemAlu_in(MemAlu_in_tb),
                    .WriteData(WriteData_tb)
                    );
                    
        initial 
            begin 
                MemToReg_tb = 1; 
                ReadData_in_tb = 32'h82;
                MemAlu_in_tb = 32'h12;
             #50
                MemAlu_in_tb = 32'h19;
             #50
                ReadData_in_tb = 32'h90;
                MemToReg_tb = 0; 
             #50
                MemToReg_tb = 1; 
            #100
                $finish;         
            end           
                    
endmodule
