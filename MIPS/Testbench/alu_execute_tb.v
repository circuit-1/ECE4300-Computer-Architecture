`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:32:44 PM
// Design Name: 
// Module Name: alu_execute_tb
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


module alu_execute_tb();


        reg [31:0] a_tb, b_tb; 
        reg [2:0] control_tb; 
        wire [31:0] result_tb; 
        wire zero_tb; 

        alu_execute ALU_EXECUTE_TB (
                    .a(a_tb),
                    .b(b_tb),
                    .control(control_tb),
                    .result(result_tb),
                    .zero(zero_tb)
                    );
       
        initial 
            begin 
                a_tb = 32'h12938; 
                b_tb = 32'h19; 
                control_tb = 3'b110; //sub
            #50 
                a_tb = 32'h983; 
                b_tb = 32'h98; 
                control_tb = 3'b000; //and
            #50 
                a_tb = 32'h123; 
                b_tb = 32'h10; 
                control_tb = 3'b001; //or
            #50 
                a_tb = 32'h09; 
                b_tb = 32'h19; 
                control_tb = 3'b111; //stl
            #50 
                a_tb = 32'h01; 
                b_tb = 32'h03; 
                control_tb = 3'b010; // add
            #50
                a_tb = 32'h12;
                b_tb = 32'h12;
                control_tb = 3'b110; 
            #100
                $finish; 
            end             
                    
endmodule
