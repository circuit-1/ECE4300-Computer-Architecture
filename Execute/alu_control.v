`timescale 1ns / 1ps
/*
Takes in 6 bit of s_extendout with alu_op and outputs select, which is the control.
for alu.v This bridges machine language with assembly language.
*/
module alu_control(
    input wire [5:0] funct, //from ID/EX latch
    input wire [1:0] aluop,
    output reg [2:0] select
    );
//These are the function field paramters for Rtype.
// ALU Op
parameter Rtype =  2'b10; //this is a 2 bit parameter, will check later
/* Radd = 2'b10,

Rsub = 2'b10,

Rand = 2'b10,

Ror = 2'b10,

Rslt = 2'b10; */

parameter lwsw = 2'b00,
Itype = 2'b01;
// ALU Control Inputs Designation
parameter ALUadd = 3'b010,  //for R-type instructions
ALUsub = 3'b110,
ALUand = 3'b000,
ALUor = 3'b001,
ALUslt = 3'b111;
//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011 
//and ALU output is 32 x's 
parameter unknown = 2'b11,
ALUx = 3'b011;
// Funct Field
parameter FUNCTadd = 6'b100000,
FUNCTsub = 6'b100010,
FUNCTand = 6'b100100,
FUNCTor = 6'b100101,
FUNCTslt = 6'b101010;
always @* begin
    case (aluop)
        Rtype: begin
            case (funct)
                FUNCTadd: select = ALUadd;
                FUNCTsub: select = ALUsub;
                FUNCTand: select = ALUand;
                FUNCTor:  select = ALUor;
                FUNCTslt: select = ALUslt;
                default:  select = ALUx;
            endcase
        end
        lwsw:    select = ALUadd;
        Itype:   select = ALUsub;
        unknown: select = ALUx;
        default: select = ALUx;
    endcase
end
endmodule
