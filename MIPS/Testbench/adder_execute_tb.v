`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:24:03 PM
// Design Name: 
// Module Name: adder_execute_tb
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


module adder_execute_tb();

        reg [31:0] add_in1_tb, add_in2_tb; 
        wire [31:0] add_out_tb; 

        adder_execute ADDER_EZECUTE_TB (
                    .add_in1(add_in1_tb),
                    .add_in2(add_in2_tb),
                    .add_out(add_out_tb)
                    );
        
        initial 
            begin 
                add_in1_tb = 32'h23; 
                add_in2_tb = 32'h123;
            #50 
                add_in1_tb = 32'h982;
                add_in2_tb = 32'h0238; 
            #50 
                add_in1_tb = 32'h913;
                add_in2_tb = 32'h9; 
            #100
                $finish;     
            end            
                    
endmodule
