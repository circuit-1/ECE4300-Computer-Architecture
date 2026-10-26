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
        output reg [1:0] wb_out,
        output reg [2:0] mem_out,
        output reg [3:0] ctrl_out,
        output reg [31:0] npc_out,
        output reg [31:0] readdat1_out,
        output reg [31:0] readdat2_out,
        output reg [31:0] sign_ext_out,
        output reg [4:0] instr_bits_20_16_out,
        output reg [4:0] instr_bits_15_11_out
);

    always @(posedge clk)begin
    if (rst) begin
        wb_out <= 2'd0;
        mem_out <= 3'd0;
        ctrl_out <= 4'd0;
        npc_out <= 32'd0;
        readdat1_out <= 32'd0;
        readdat2_out <= 32'd0;
        sign_ext_out <= 32'd0;
        instr_bits_20_16_out <= 5'd0;
        instr_bits_15_11_out <= 5'd0;
    end else begin
        wb_out <= ctrl_wb;
        mem_out <= ctrl_mem;
        ctrl_out <= ctrl_ex;
        npc_out <= npc;
        readdat1_out <= readdat1;
        readdat2_out <= readdat2;
        sign_ext_out <= sign_ext;
        instr_bits_20_16_out <= instr_bits_20_16;
        instr_bits_15_11_out <= instr_bits_15_11;   
    end
 end
endmodule
