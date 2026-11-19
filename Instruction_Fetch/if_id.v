`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 10:20:21 AM
// Design Name: 
// Module Name: if_id
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


module if_id(
                input clk,
                input reset,
                input [31:0] adder_in,
                input [31:0] instr_in,
                output reg [31:0] adder_out,
                output reg [31:0] instr_out
            );
            
  always @(posedge clk) begin
      if (reset) begin
           adder_out <= 32'd0;
           instr_out <= 32'd0;
      end else begin 
            adder_out <= adder_in; 
            instr_out <= instr_in; 
      end
  end
         
endmodule
