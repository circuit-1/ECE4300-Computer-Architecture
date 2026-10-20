module regfile(
  input clk,
  input rst,
  input regwrite,
  input [4:0] rs,
  input [4:0] rt,
  input [4:0] rd,
  input [31:0] writedata,
  output reg [31:0] A_readdat1,
  output reg [31:0] B_readdat2
);
  reg [31:0] gpr [31:0];
  
  always @(posedge clk) begin
    if (rst) begin //resets all registers to 0 when reset triggered
      for (integer i = 0; i < 32; i = i + 1)
          gpr[i] <= 32'b0;
    end else if (regwrite) begin //writes writedata into register destination (rd) when regwrite == 1
      gpr[rd] <= writedata;
    end
  end
  
    always @(*) begin
      A_readdat1 = gpr[rs];
      B_readdat2 = gpr[rt];
    end
    
endmodule
