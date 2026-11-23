`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:39:41 PM
// Design Name: 
// Module Name: alu_control_execute
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


module alu_control_execute(
            input [5:0] funct,
            input [1:0] aluop,
            output reg [2:0] select
            );
       
        
        always @(*) 
            case (aluop) 
                2'b10: 
                    begin 
                        case(funct)
                            6'b100_000: select = 3'b010; // add 
                            6'b100_010: select = 3'b110; // sub
                            6'b100_100: select = 3'b000; // and
                            6'b100_101: select = 3'b001; // or 
                            6'b101_010: select = 3'b111; // stl     
                            default:    select = 3'bx;                  
                        endcase
                    end
                2'b00: select = 3'b010; // lw, sw 
                2'b01: select = 3'b110; // beq, branch
                default: select = 3'bx;                   
            endcase       
            
endmodule
