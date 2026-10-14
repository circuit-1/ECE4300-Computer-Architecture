module instruction_memory (
    input  wire        clk,
    input  wire        reset,
    input  wire [31:0] address,
    output reg  [31:0] instruction
);
    always @(posedge clk) begin
        if (reset)
            instruction <= 32'd0;
        else begin
case (address)
    32'd0: instruction <= 32'hA00000AA;
    32'd1: instruction <= 32'h10000011;
    32'd2: instruction <= 32'h20000022;
    32'd3: instruction <= 32'h30000033;
    32'd4: instruction <= 32'h40000044;
    32'd5: instruction <= 32'h50000055;
    32'd6: instruction <= 32'h60000066;
    32'd7: instruction <= 32'h70000077;
    32'd8: instruction <= 32'h80000088;
    32'd9: instruction <= 32'h90000099;
    default: instruction <= 32'h00000000;
endcase
        end
    end
endmodule
