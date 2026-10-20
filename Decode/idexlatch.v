module idexlatch (
        input clk,                                  //inputs
        input rst,
        input [1:0] ctrl_wb,
        input [2:0] ctrl_mem,
        input [3:0] ctrl_ex,
        input [31:0] npc,
        input [31:0] readdat1,
        input [31:0] readdat2,
        input [31:0] sign_ext,
        input [4:0] instr_bits_20_16,
        input [4:0] instr_bits_15_11,
                                                    //outputs
        output [1:0] wb_out,
        output [2:0] mem_out,
        output [3:0] ctrl_out,
        output [31:0] npc_out,
        output [31:0] readdat1_out,
        output [31:0] readdat2_out,
        output [31:0] sign_ext_out,
        output [4:0] instr_bits_20_16_out,
        output [4:0] instr_bits_15_11_out
);
endmodule
