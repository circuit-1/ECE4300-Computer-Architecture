`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2026 11:54:38 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
                input clk_top, rst_top,
                input [31:0] if_id_latch, 
                input RegWrite,
                input [31:0] mem_wb_write_data,    // WriteRegLocation
                input [4:0] wb_write_reg_location, //rd
                input [31:0] npc_in,
                
                output [31:0] npc_out, // starts initial value of 0
                output [1:0] id_ex_wb, 
                output [2:0] id_ex_mem, 
                output [3:0] id_ex_ex, 
                output [31:0] id_ex_readdata1, id_ex_readdata2, id_ex_signExt,
                output [4:0] id_ex_instr_2016, id_ex_instr_1511                              
            );

            
            wire [1:0] ctrl_wb_in; 
            wire [2:0] ctrl_mem_in; 
            wire [3:0] ctrl_ex_in;
            wire [31:0] in_readA, in_readB; 
            wire [31:0] signex_in;
            
           
                
            control_decoder CONTROL_DECODER (
                .clk(clk_top),
                .rst(rst_top),
                .opcode(if_id_latch[31:26]),
                .wb(ctrl_wb_in),
                .mem(ctrl_mem_in),
                .ex(ctrl_ex_in)
                ); 
            
            
            id_ex ID_EX_DECODER (
            .clk(clk_top),   
            .rst(rst_top),
        
            .ctrl_wb(ctrl_wb_in),
            .ctrl_mem(ctrl_mem_in),
            .ctrl_ex(ctrl_ex_in),
            .npc(npc_in),
            .readdat1(in_readA),
            .readdat2(in_readB),
            .sign_ext(signex_in),
            .instr_bits_20_16(if_id_latch[20:16]),
            .instr_bits_15_11(if_id_latch[15:11]),
                                                    //outputs
            .wb_out(id_ex_wb),
            .mem_out(id_ex_mem),
            .ctrl_out(id_ex_ex),
            .npc_out(npc_out),
            .readdat1_out(id_ex_readdata1),
            .readdat2_out(id_ex_readdata2),
            .sign_ext_out(id_ex_signExt),
            .instr_bits_20_16_out(id_ex_instr_2016),
            .instr_bits_15_11_out(id_ex_instr_1511)
                );  
                
            signext_decoder SIGNEXT_DECODER (
            .immediate(if_id_latch[15:0]),
            .extended(signex_in)
          ); 
                    
            regfile_decoder REGFILE_DECODER (
              .clk(clk_top),
              .rst(rst_top),
              .regwrite(RegWrite),
              .rs(if_id_latch[25:21]),
              .rt(if_id_latch[20:16]),
              .rd(wb_write_reg_location),
              .writedata(mem_wb_write_data),
              .A_readdat1(in_readA),
              .B_readdat2(in_readB)
            );      
                 
endmodule
