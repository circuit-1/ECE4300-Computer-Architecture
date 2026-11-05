`timescale 1ns / 1ps
/*
Execute stage. The port names match Execute/execute_test.v.
*/
module execute(
    input wire clk,
    input wire [1:0] ctlwb_in,
    input wire [2:0] ctlm_in,
    input wire [31:0] npc, rdata1, rdata2, s_extend,
    input wire [4:0] instr_2016, instr_1511,
    input wire [1:0] alu_op,
    input wire [5:0] funct,
    input wire alusrc, regdst,
    output wire [1:0] ctlwb_out,
    output wire [2:0] ctlm_out,
    output wire [31:0] adder_out, alu_result_out, rdata2_out,
    output wire [4:0] muxout_out,
    output wire branch, memread, memwrite,
    output wire [31:0] EX_MEM_NPC,
    output wire zero
    );

    // Internal signals connecting the execute-stage components.
    wire [31:0] b, aluout;
    wire [4:0] muxout;
    wire [2:0] control;
    wire aluzero;
    assign ctlm_out = ctlm_in;

    adder adder3(
        .add_in1(npc),
        .add_in2(s_extend),
        .add_out(adder_out)
    );

    bottom_mux bottom_mux3(
        .a(instr_1511),
        .b(instr_2016),
        .sel(regdst),
        .y(muxout)
    );

    alu_control alu_control3(
        .funct(funct),
        .aluop(alu_op),
        .select(control)
    );

    alu alu3(
        .a(rdata1),
        .b(b),
        .control(control),
        .result(aluout),
        .zero(aluzero)
    );

    top_mux top_mux3(
        .y(b),
        .a(s_extend),
        .b(rdata2),
        .alusrc(alusrc)
    );

    ex_mem ex_mem3(
        .clk(clk),
        .ctlwb_out(ctlwb_in),
        .ctlm_out(ctlm_in),
        .adder_out(adder_out),
        .aluzero(aluzero),
        .aluout(aluout),
        .readdat2(rdata2),
        .muxout(muxout),
        .wb_ctlout(ctlwb_out),
        .branch(branch),
        .memread(memread),
        .memwrite(memwrite),
        .add_result(EX_MEM_NPC),
        .zero(zero),
        .alu_result(alu_result_out),
        .rdata2out(rdata2_out),
        .five_bit_muxout(muxout_out)
    );

endmodule // EXECUTE
