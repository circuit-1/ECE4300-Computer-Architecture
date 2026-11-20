module control(
                input clk,
                input rst,
                input [5:0] opcode,
                output reg [1:0] wb,
                output reg [2:0] mem,
                output reg [3:0] ex
                );             
                
        reg [8:0] ctrl;      
       
        always @(posedge clk or negedge rst) 
            begin             
                if (rst) 
                    begin 
                        ctrl <= 9'b00_000_0000; 
                    end 
                else 
                    case(opcode)
                        6'b000_000: ctrl = 9'b10_000_0110; // R-format
                        6'b100_011: ctrl = 9'b11_010_1000; // LW
                        6'b101_011: ctrl = 9'b00_001_1000; // SW
                        6'b000_100: ctrl = 9'b00_100_0001; // BEQ
                        6'b001_000: ctrl = 9'b10_000_1000; // ADDI
                        default:    ctrl = 9'b00_000_0000;
                    endcase 
            end      
        
        
         always @(*) 
            begin 
                {wb, mem, ex} = ctrl;
            end
    
                
endmodule
