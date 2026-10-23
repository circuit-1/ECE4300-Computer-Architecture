module control_tb();

        reg clk_tb = 1, rst_tb; 
        reg [5:0] opcode_tb; 
        wire [1:0] wb_tb;
        wire [2:0] mem_tb; 
        wire [3:0] ex_tb; 

        control CONTROL_TB (
                    .clk(clk_tb),
                    .rst(rst_tb),
                    .opcode(opcode_tb),
                    .wb(wb_tb),
                    .mem(mem_tb),
                    .ex(ex_tb)
                    );
                    
        always 
            #5 clk_tb = ~clk_tb; 
        
        
        initial 
            begin 
                rst_tb = 1; 
                opcode_tb = 6'b000_000; // R-Format
             #50 
                rst_tb = 0; 
             #50 
                opcode_tb = 6'b100_011; // LW
             #50 
                opcode_tb = 6'b101_011; // SW
             #50
                opcode_tb = 6'b000_100; // BEQ
             #50 
                opcode_tb = 6'b011_111;  // random opcode
             #100 
             $finish; 
            end             
                    
                    
endmodule
