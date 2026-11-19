module fetch(

    input wire clk,
    rst,
    ex_mem_pc_src,
    input wire [31:0] ex_mem_npc,
    output wire [31:0] if_id_instr,
    if_id_npc
);

//internal
    wire [31:0] pc_out,
    pc_plus1,
    pc_mux,
    instr_data;

mux m0( 
    .in_0(pc_plus1),
    .in_1(ex_mem_npc),
    .out(pc_mux),
    .sel(ex_mem_pc_src)
);

pc pc0( 
    .clk(clk),
    .reset(rst),
    .pc_in(pc_mux),
    .pc_out(pc_out)
);

adder add0( 
    .clk(clk),
    .reset(rst),
    .pcin(pc_out),
    .pcout(pc_plus1)
);

mem inMem0( 
    .clk(clk),
    .reset(rst),
    .addr(pc_out),
    .data(instr_data)
);

if_id if_idLatch0( 
    .clk(clk),
    .reset(rst),
    .adder_in(pc_plus1),
    .instr_in(instr_data),
    .adder_out(if_id_npc),
    .instr_out(if_id_instr)
);


endmodule
