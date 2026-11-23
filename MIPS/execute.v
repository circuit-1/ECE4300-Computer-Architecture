`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2026 01:38:15 PM
// Design Name: 
// Module Name: execute
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


module execute(
            input clk,
            input [1:0] ctlwb_in,
            input [2:0] ctlm_in,
            input [31:0] npc,
            input [31:0] rdata1,
            input [31:0] rdata2,
            input [31:0] s_extend,
            input [4:0] instr_2016,
            input [4:0] instr_1511,
            input alusrc,
            input regsdt,
            input [1:0] alu_op,
            output [1:0] ctlwb_out_latch,
            output [2:0] ctlm_out_latch,
            output [31:0] adder_result_latch,
            output [31:0] alu_result_latch,
            output [31:0] rdata2_out_latch,
            output [4:0] muxout_out_latch,
            output zero_latch
            );
            
         wire [31:0] add_out; 
         wire [31:0] top_mux_out; 
         wire [4:0] bottom_mux_out;
         wire [31:0] alu_out; // alu 
         wire zero_out; // alu
         wire [2:0] alu_ctrl_out; // alu control 

         adder_execute ADDER_EXECUTE (
            .add_in1(npc),
            .add_in2(s_extend),
            .add_out(add_out)
            );     
            
        top_mux_execute TOP_MUX_EXECUTE (
            .a(rdata2), // ReadData2
            .b(s_extend), // SignExtend
            .y(top_mux_out),
            .alusrc(alusrc)
            );  
             
       alu_execute ALU_EXECUTE (
            .a(rdata1),
            .b(top_mux_out),
            .control(alu_ctrl_out),
            .result(alu_out),
            .zero(zero_out)
            );
            
        alu_control_execute ALU_CONTROL_EXECUTE (
            .funct(s_extend[5:0]),
            .aluop(alu_op),
            .select(alu_ctrl_out)
            );    
       
       bottom_mux_execute BOTTOM_MUX_EXECUTE (
            .a(instr_2016),
            .b(instr_1511),
            .sel(regsdt),
            .y(bottom_mux_out)
            ); 
       
       ex_mem EX_MEM_EXECUTE (
            .clk(clk),
            .ctlwb_out(ctlwb_in),
            .ctlm_out(ctlm_in),
            .adder_out(add_out),
            .aluzero(zero_out),
            .aluout(alu_out),
            .readdat2(rdata2),
            .muxout(bottom_mux_out),
            .wb_ctlout(ctlwb_out_latch),
            .mem_ctlout(ctlm_out_latch),
            .add_result(adder_result_latch),
            .zero(zero_latch),
            .alu_result(alu_result_latch),
            .rdata2out(rdata2_out_latch),
            .five_bit_muxout(muxout_out_latch)
            );                
            
endmodule
