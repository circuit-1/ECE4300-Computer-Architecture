`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:40:25 PM
// Design Name: 
// Module Name: alu_control_execute_tb
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


module alu_control_execute_tb();


        reg [5:0] funct_tb; 
        reg [1:0] aluop_tb; 
        wire [2:0] select_tb; 

        alu_control_execute ALU_CONTROL_EXECUTE_TB (
            .funct(funct_tb),
            .aluop(aluop_tb),
            .select(select_tb)
            );
            
        initial 
            begin 
                aluop_tb = 2'b10; 
                funct_tb = 6'b100_000; // add
             #50
                funct_tb = 6'b100_010; // sub
             #50 
                funct_tb = 6'b100_100; // and
             #50 
                funct_tb = 6'b100_101; // or
             #50 
                funct_tb = 6'b101_010; // stl
             #50
                aluop_tb = 2'b00; 
             #50 
                aluop_tb = 2'b01; 
             #100
                $finish; 
            end    
            

endmodule
