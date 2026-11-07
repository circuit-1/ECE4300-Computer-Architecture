`timescale 1ns / 1ps
/*
This is the latch that receives signals form all the modules of the execute stage. Its outputs go to MEM/WB and FETCH.
*/
module ex_mem(
    input wire clk,
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [31:0] adder_out,
    input wire aluzero,
    input wire [31:0] aluout, readdat2,
    input wire [4:0] muxout,
    output reg [1:0] wb_ctlout,
    output reg [2:0] mem_ctlout,
    output reg [31:0] add_result,
    output reg zero,
    output reg [31:0] alu_result, rdata2out,
    output reg [4:0] five_bit_muxout
        );
always @(posedge clk) begin
    wb_ctlout <= ctlwb_out;
    mem_ctlout <= ctlm_out;                                                  
    add_result <= adder_out;   
    zero <= aluzero;
    alu_result <= aluout;
    rdata2out <= readdat2;
    five_bit_muxout <= muxout;
end
endmodule // ex_mem
