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
        
        reg [31:0] instr_in [0:9];
        
        initial begin
            if(reset) begin
                data <= 32'd0;
            end else begin 
                instr_in[0] = 32'hA00000AA;
                instr_in[1] = 32'h10000011;
                instr_in[2] = 32'h20000022;
                instr_in[3] = 32'h30000033;
                instr_in[4] = 32'h40000044;
                instr_in[5] = 32'h50000055;
                instr_in[6] = 32'h60000066;
                instr_in[7] = 32'h70000077;
                instr_in[8] = 32'h80000088;
                instr_in[9] = 32'h90000099;
            end
        end             
        
        always @(posedge clk) begin
                if (reset) begin
                    data <= 32'd0;
                end else if (addr <= 32'd9) begin
                    data <= instr_in[addr];
                end else begin
                    data <= 32'd0;
                end
            end
        
        
endmodule
