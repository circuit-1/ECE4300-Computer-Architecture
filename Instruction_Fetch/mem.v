`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 02:05:07 PM
// Design Name: 
// Module Name: mem
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


module mem (
            input clk,
            input reset,
            input [31:0] addr, 
            output reg [31:0] data = 32'd0
        );
        
        reg [31:0] instr_in [0:255];
        integer i;
        
        initial begin
            for (i = 0; i < 256; i = i + 1) instr_in[i] = 32'd0;
            $readmemb("instr.mem", instr_in);
        end             
        
        always @(posedge clk) begin
                if (reset) begin
                    data <= 32'd0;
                end else if (addr < 32'd256) begin
                    data <= instr_in[addr[7:0]];
                end else begin
                    data <= 32'd0;
                end
            end
        
        
endmodule
