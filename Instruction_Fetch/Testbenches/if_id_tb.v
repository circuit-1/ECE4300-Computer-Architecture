`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 10:22:24 AM
// Design Name: 
// Module Name: if_id_tb
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


module if_id_tb();

    reg clk_tb = 1;
    reg reset_tb = 0;
    reg [31:0] adder_in_tb, instr_in_tb; 
    wire [31:0] adder_out_tb, instr_out_tb;
    

    if_id IF_ID_TB (
                .clk(clk_tb),
                .reset(reset_tb),
                .adder_in(adder_in_tb),
                .instr_in(instr_in_tb),
                .adder_out(adder_out_tb),
                .instr_out(instr_out_tb)
            );
            
     always 
        #5 clk_tb = ~clk_tb;        
     
     initial 
        begin
            adder_in_tb = 32'd273; 
            instr_in_tb = 32'd1283; 
         #50 
            adder_in_tb = 32'd23;
         #50 
            adder_in_tb = 32'd9123; 
         #50 
            instr_in_tb = 32'd12;
         #100
            $finish;  
        end
            
            
endmodule
