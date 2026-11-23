`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:32:04 PM
// Design Name: 
// Module Name: alu_execute
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


module alu_execute(
            input [31:0] a,
            input [31:0] b,
            input [2:0] control,
            output reg [31:0] result = 32'h0, // avoiding don't care at the beginning
            output zero
            );
         
        always @(*) 
            begin 
                case (control)
                    3'b010: result = a + b; 
                    3'b110: result = a - b; 
                    3'b000: result = a & b; 
                    3'b001: result = a | b; 
                    3'b111: result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0 ;
                    default: result = 32'bx; 
                endcase
            end
                        
          assign zero = (result == 32'd0) ? 1 : 0;          
      
endmodule
