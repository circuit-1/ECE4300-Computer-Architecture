`timescale 1ns / 1ps

module fetch_tb;
    reg         clk_tb;
    reg         rst_tb;
    reg         ex_mem_pc_src_tb;
    reg  [31:0] ex_mem_npc_tb;
    wire [31:0] if_id_instr_tb;
    wire [31:0] if_id_npc_tb;

    fetch dut (
        .clk          (clk_tb),
        .rst          (rst_tb),
        .ex_mem_pc_src(ex_mem_pc_src_tb),
        .ex_mem_npc   (ex_mem_npc_tb),
        .if_id_instr  (if_id_instr_tb),
        .if_id_npc    (if_id_npc_tb)
    );

    initial clk_tb = 1'b0;
    always #1 clk_tb = ~clk_tb;

    initial begin
        rst_tb           = 1'b1;
        ex_mem_pc_src_tb = 1'b0;
        ex_mem_npc_tb    = 32'hFFFFFFFF;

        #4;
        rst_tb = 1'b0;
        
        #20;
        ex_mem_npc_tb    = 32'h00000000;
        ex_mem_pc_src_tb = 1'b1;

        #50;
        ex_mem_pc_src_tb = 1'b0;

        #20;

        $finish;
    end

endmodule
