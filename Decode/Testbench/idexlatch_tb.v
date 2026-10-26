module idexlatch_tb();
        
        reg clk_tb = 1, rst_tb; 
        reg [1:0] ctrl_wb_tb; 
        reg [2:0] ctrl_mem_tb; 
        reg [3:0] ctrl_ex_tb; 
        reg [31:0] npc_tb; 
        reg [31:0] readdata1_tb; 
        reg [31:0] readdata2_tb;
        reg [31:0] sign_ext_tb;
        reg [4:0] instr_bits_20_16_tb; 
        reg [4:0] instr_bits_15_11_tb; 
        
        wire [1:0] wb_out_tb;
        wire [2:0] mem_out_tb;
        wire [3:0] ctrl_out_tb;
        wire [31:0] npc_out_tb;
        wire [31:0] readdat1_out_tb;
        wire [31:0] readdat2_out_tb; 
        wire [31:0] sign_ext_out_tb;
        wire [4:0] instr_bits_20_16_out_tb;
        wire [4:0] instr_bits_15_11_out_tb;


        idexlatch IDEXLATCH_TB (
            .clk(clk_tb),                                  //inputs
            .rst(rst_tb),
        
            .ctrl_wb(ctrl_wb_tb),
            .ctrl_mem(ctrl_mem_tb),
            .ctrl_ex(ctrl_ex_tb),
            .npc(npc_tb),
            .readdat1(readdata1_tb),
            .readdat2(readdata2_tb),
            .sign_ext(sign_ext_tb),
            .instr_bits_20_16(instr_bits_20_16_tb),
            .instr_bits_15_11(instr_bits_15_11_tb),
                                                    //outputs
            .wb_out(wb_out_tb),
            .mem_out(mem_out_tb),
            .ctrl_out(ctrl_out_tb),
            .npc_out(npc_out_tb),
            .readdat1_out(readdat1_out_tb),
            .readdat2_out(readdat2_out_tb),
            .sign_ext_out(sign_ext_out_tb),
            .instr_bits_20_16_out(instr_bits_20_16_out_tb),
            .instr_bits_15_11_out(instr_bits_15_11_out_tb)
                );
        
        always 
            #5 clk_tb = ~clk_tb; 
        
        
        initial 
            begin 
                rst_tb = 1; 
                ctrl_wb_tb = 2'b10; 
                ctrl_mem_tb = 3'b000;
                ctrl_ex_tb = 4'b1100; 
                npc_tb = 32'hA1023;
                sign_ext_tb = 32'h12;
                readdata1_tb = 32'h1283; 
                readdata2_tb = 32'h9823;
                instr_bits_20_16_tb = 32'h124; 
                instr_bits_15_11_tb = 32'h12a;
             #50
                rst_tb = 0; 
             #50 
                ctrl_wb_tb = 2'b11; 
                ctrl_mem_tb = 3'b010;
                ctrl_ex_tb = 4'b0001; 
             #50 
                sign_ext_tb = 32'h2983;
                ctrl_wb_tb = 2'b11; 
                ctrl_mem_tb = 3'b010;
                ctrl_ex_tb = 4'b0001; 
                readdata1_tb = 32'h8373; 
                readdata2_tb = 32'h12983; 
             #50 
                instr_bits_20_16_tb = 32'h1a; 
                instr_bits_15_11_tb = 32'h183; 
             #100
             $finish;                                
            end        
                
                
