`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:45:56 PM
// Design Name: 
// Module Name: pc
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


module pc(
            input clk,
            input reset,
            input [31:0] pc_in,
            output reg [31:0] pc_out = 32'd0
        );
        
always @(posedge clk) begin
        if(reset) begin
            pc_out <= 32'd0;                
        end else begin 
            pc_out <= pc_in; 
        end
      end
        
endmodule
