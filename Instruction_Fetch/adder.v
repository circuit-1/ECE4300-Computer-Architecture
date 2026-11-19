`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 09:43:33 AM
// Design Name: 
// Module Name: adder
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


module adder(
                input clk,
                input reset,
                input [31:0] pcin,
                output [31:0] pcout
            );
  always @(posedge clk) begin
    if(reset) begin
      assign pcout = 32'd0
    end else begin
      assign pcout = pcin + 32'd1;
    end
  end
endmodule
