`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:36:05 PM
// Design Name: 
// Module Name: ex_mem
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


module ex_mem(
            input clk,
            input [1:0] ctlwb_out,
            input [2:0] ctlm_out,
            input [31:0] adder_out,
            input aluzero,
            input [31:0] aluout,
            input [31:0] readdat2,
            input [4:0] muxout,
            output reg [1:0] wb_ctlout,
            output reg [2:0] mem_ctlout,
            output reg [31:0] add_result,
            output reg  zero,
            output reg [31:0] alu_result,
            output reg [31:0] rdata2out,
            output reg [6:0] five_bit_muxout
            );
            
            always @(posedge clk) 
                begin 
                    wb_ctlout <= ctlwb_out; 
                    mem_ctlout <= ctlm_out; 
                    add_result <= adder_out; 
                    zero <= aluzero; 
                    alu_result <= aluout; 
                    rdata2out <= readdat2; 
                    five_bit_muxout <= muxout;
                end
            
endmodule
