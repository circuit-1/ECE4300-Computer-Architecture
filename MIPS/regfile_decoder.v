`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2026 10:22:53 AM
// Design Name: 
// Module Name: regfile_decoder
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


module regfile_decoder(
              input clk,
              input rst,
              input regwrite,
              input [4:0] rs, // read_data1
              input [4:0] rt, // read_data2
              input [4:0] rd, // write_reg 
              input [31:0] writedata,
              output reg [31:0] A_readdat1 = 32'h0,
              output reg [31:0] B_readdat2 = 32'h0
            );
            
          reg [31:0] gpr [0:31]; // create a gpr array has a depth of 32 and 32-bit of each depth
                                // each register (rs, rd, rt) contains 32 bits -> depth is 32-bit
          integer i; 
          
          always @(posedge clk or negedge rst) 
            begin
                if (rst) //resets all registers to 0 when reset triggered
                    begin 
                      for (i = 0; i < 32; i = i + 1)
                          gpr[i] <= 32'b0;
                    end 
                else if (regwrite) //writes writedata into register destination (rd) when regwrite == 1
                    begin 
                          gpr[rd] <= writedata; // write data value inside the location of gpr[rd]
                    end
            end

            always @(*) 
                begin
                  A_readdat1 <= gpr[rs];
                  B_readdat2 <= gpr[rt];
                end
      // reg module is output the location from the input      
      
endmodule
