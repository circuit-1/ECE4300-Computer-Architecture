`timescale 1ns / 1ps
/*
Implements the 32-bit ALUSrc multiplexer shown in the execute-stage diagram.
*/
module top_mux(
output wire [31:0] y,
input wire [31:0] a,
input wire [31:0] b,
input wire alusrc // Select Input
   );
   
   assign y = alusrc ? b : a; // 1 = b, 0 = a
endmodule // mux
