module decode_tb();
        
        reg clk_tb = 1, rst_tb; 
        reg [31:0] if_id_latch_tb; 
        reg RegWrite_tb; 
        reg [31:0] mem_wb_write_data_tb;    // WriteRegLocation
        reg [4:0] wb_write_reg_location_tb; //rd
        reg [31:0] npc_in_tb;
        
        wire [31:0] npc_out_tb;
        wire [1:0] id_ex_wb_tb;
        wire [2:0] id_ex_mem_tb; 
        wire [3:0] id_ex_ex_tb;
        wire [31:0] id_ex_readdata1_tb, id_ex_readdata2_tb, id_ex_signExt_tb;
        wire [4:0] id_ex_instr_2016_tb, id_ex_instr_1511_tb; 
        
        
        decode DECODE_TB (
                        .clk_top(clk_tb), .rst_top(rst_tb),
                        .if_id_latch(if_id_latch_tb), 
                        .RegWrite(RegWrite_tb),
                        .mem_wb_write_data(mem_wb_write_data_tb),    // WriteRegLocation
                        .wb_write_reg_location(wb_write_reg_location_tb), //rd
                        .npc_in(npc_in_tb),
                        
                        .npc_out(npc_out_tb),
                        .id_ex_wb(id_ex_wb_tb), 
                        .id_ex_mem(id_ex_mem_tb), 
                        .id_ex_ex(id_ex_ex_tb), 
                        .id_ex_readdata1(id_ex_readdata1_tb), .id_ex_readdata2(id_ex_readdata2_tb), .id_ex_signExt(id_ex_signExt_tb),
                        .id_ex_instr_2016(id_ex_instr_2016_tb), .id_ex_instr_1511(id_ex_instr_1511_tb)                              
                    );


        
        always 
            #5 clk_tb = ~clk_tb;
        
        initial 
            begin 
                rst_tb = 1;
                if_id_latch_tb = 32'b100011_00001_01000_0001000000100100; // lw, ReadReg1 = 1(rs), ReadReg2 = 8(rt), SignExt = 1024
                RegWrite_tb = 1;
                mem_wb_write_data_tb = 32'h2837; 
                wb_write_reg_location_tb = 5'h3;
                npc_in_tb = 32'h1280;
             #50 
                rst_tb = 0; 
             #100
                mem_wb_write_data_tb = 32'h802; 
                wb_write_reg_location_tb = 5'h1;
                if_id_latch_tb = 32'b101011_00001_01000_0000011101010001; // sw, ReadReg1 = 1, ReadReg2 = 8, SignExt = 1873
            #50 
                mem_wb_write_data_tb = 32'h91283; 
                wb_write_reg_location_tb = 5'h9; 
                if_id_latch_tb = 32'b000100_00010_00011_1111111111111011; // beq, ReadReg1 = 2, ReadReg2 = 3, SignExt = -5
            #50 
                RegWrite_tb = 0; 
            #100
            $finish;
            end 

endmodule
