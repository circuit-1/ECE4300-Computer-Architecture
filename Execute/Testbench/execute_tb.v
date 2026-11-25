module execute_tb();
        
            reg clk_tb = 1;
            reg [1:0] ctlwb_in_tb;
            reg [2:0] ctlm_in_tb;
            reg [31:0] npc_tb;
            reg [31:0] rdata1_tb;
            reg [31:0] rdata2_tb;
            reg [31:0] s_extend_tb;
            reg [4:0] instr_2016_tb;
            reg [4:0] instr_1511_tb;
            reg alusrc_tb; 
            reg regsdt_tb;
            reg [1:0] alu_op_tb;
            wire [1:0] ctlwb_out_latch_tb;
            wire [2:0] ctlm_out_latch_tb;
            wire [31:0] adder_result_latch_tb;
            wire [31:0] alu_result_latch_tb;
            wire [31:0] rdata2_out_latch_tb;
            wire [4:0] muxout_out_latch_tb;
            wire zero_latch_tb; 
          
        execute EXECUTE_TB (
            .clk(clk_tb),
            .ctlwb_in(ctlwb_in_tb),
            .ctlm_in(ctlm_in_tb),
            .npc(npc_tb),
            .rdata1(rdata1_tb),
            .rdata2(rdata2_tb),
            .s_extend(s_extend_tb),
            .instr_2016(instr_2016_tb),
            .instr_1511(instr_1511_tb),
            .alusrc(alusrc_tb),
            .regsdt(regsdt_tb),            
            .alu_op(alu_op_tb),
            
            .ctlwb_out_latch(ctlwb_out_latch_tb),
            .ctlm_out_latch(ctlm_out_latch_tb),
            .adder_result_latch(adder_result_latch_tb),
            .alu_result_latch(alu_result_latch_tb),
            .rdata2_out_latch(rdata2_out_latch_tb),
            .muxout_out_latch(muxout_out_latch_tb),
            .zero_latch(zero_latch_tb)
            );
            
       
        always 
            #5 clk_tb = ~clk_tb; 
        
        initial 
            begin 
                ctlwb_in_tb = 2'b10; 
                ctlm_in_tb = 3'b111; 
                npc_tb = 32'h31;
                rdata1_tb = 32'h8172; 
                rdata2_tb = 32'h87; 
                s_extend_tb = 32'h00000020; // add - R_format
                instr_2016_tb = 5'd17; 
                instr_1511_tb = 5'd1; 
                alusrc_tb = 1'b1;
                regsdt_tb = 1'b0; 
                alu_op_tb = 2'b10; 
             #50 
                ctlwb_in_tb = 2'b11; 
                ctlm_in_tb = 3'b011; 
                npc_tb = 32'h182;
                rdata1_tb = 32'h8172; 
                rdata2_tb = 32'h1726; 
                s_extend_tb = 32'h00000022; // sub
                instr_2016_tb = 5'd15; 
                instr_1511_tb = 5'd11; 
                alusrc_tb = 1'b1;
                regsdt_tb = 1'b1;
             #50 
                ctlwb_in_tb = 2'b00; 
                ctlm_in_tb = 3'b000; 
                npc_tb = 32'h81;
                rdata1_tb = 32'h8; 
                rdata2_tb = 32'h1; 
                s_extend_tb = 32'h00000024; // and
                instr_2016_tb = 5'd1; 
                instr_1511_tb = 5'd12; 
                alusrc_tb = 1'b0;
                regsdt_tb = 1'b1;
             #50 
                ctlwb_in_tb = 2'b01; 
                ctlm_in_tb = 3'b101; 
                npc_tb = 32'h8132;
                rdata1_tb = 32'h853; 
                rdata2_tb = 32'h164; 
                s_extend_tb = 32'h00000025; // or
                instr_2016_tb = 5'd9; 
                instr_1511_tb = 5'd12; 
                alusrc_tb = 1'b1;
                regsdt_tb = 1'b0;
             #50 
                ctlwb_in_tb = 2'b01; 
                ctlm_in_tb = 3'b101; 
                npc_tb = 32'h8132;
                rdata1_tb = 32'h853; 
                rdata2_tb = 32'h164; 
                s_extend_tb = 32'h0000002A; // stl
                instr_2016_tb = 5'd9; 
                instr_1511_tb = 5'd12; 
                alusrc_tb = 1'b1;
                regsdt_tb = 1'b0;
             #50
                ctlwb_in_tb = 2'b10; 
                ctlm_in_tb = 3'b001; 
                npc_tb = 32'h235;
                rdata1_tb = 32'h128; 
                rdata2_tb = 32'h1723; 
                s_extend_tb = 32'h1287; // random 
                instr_2016_tb = 5'd10; 
                instr_1511_tb = 5'd11; 
                alusrc_tb = 1'b1;
                regsdt_tb = 1'b0;
              #50 
                // Memory Reference: LW (Load Word - Address Calculation: base + offset)
                ctlwb_in_tb  = 2'b11; // RegWrite = 1, MemtoReg = 1 (Mem data to reg)
                ctlm_in_tb   = 3'b100; // MemRead = 1, MemWrite = 0, Branch = 0
                npc_tb       = 32'h00000038;
                rdata1_tb    = 32'h1000; // Base address
                rdata2_tb    = 32'd0; 
                s_extend_tb  = 32'h00000004; // Offset = 4
                instr_2016_tb= 5'd8;  // rt (destination for lw)
                instr_1511_tb= 5'd0;  // unused for lw dest mux
                alusrc_tb    = 1'b1;   // Select immediate/offset
                regsdt_tb    = 1'b0;   // RegDst = 0 (selects rt)
                alu_op_tb    = 2'b00;  // Addition for address calc
             
             #50 
                // Memory Reference: SW (Store Word - Address Calculation)
                ctlwb_in_tb  = 2'b00; // RegWrite = 0
                ctlm_in_tb   = 3'b010; // MemRead = 0, MemWrite = 1, Branch = 0
                npc_tb       = 32'h0000003C;
                rdata1_tb    = 32'h1000; // Base address
                rdata2_tb    = 32'hABCD; // Data to store
                s_extend_tb  = 32'h00000008; // Offset = 8
                instr_2016_tb= 5'd9;  // rt (source data register)
                instr_1511_tb= 5'd0; 
                alusrc_tb    = 1'b1;   // Select immediate/offset
                regsdt_tb    = 1'b0;   
                alu_op_tb    = 2'b00;  // Addition
             
             #50 
                // Branch Equal: BEQ (Equal case -> zero_latch should be 1)
                ctlwb_in_tb  = 2'b00; 
                ctlm_in_tb   = 3'b001; // Branch = 1
                npc_tb       = 32'h00000040; // NPC ready for branch adder target calc
                rdata1_tb    = 32'd42; 
                rdata2_tb    = 32'd42; // Equal values -> subtract results in zero
                s_extend_tb  = 32'h00000005; // Branch offset
                instr_2016_tb= 5'd2; 
                instr_1511_tb= 5'd3; 
                alusrc_tb    = 1'b0;   // Compare two registers
                regsdt_tb    = 1'b0; 
                alu_op_tb    = 2'b01;  // Subtraction for branch comparison
                
             #50 
                // Branch Equal: BEQ (Not equal case -> zero_latch should be 0)
                ctlwb_in_tb  = 2'b00; 
                ctlm_in_tb   = 3'b001; // Branch = 1
                npc_tb       = 32'h00000044;
                rdata1_tb    = 32'd42; 
                rdata2_tb    = 32'd99; // Different values
                s_extend_tb  = 32'h00000005; 
                instr_2016_tb= 5'd2; 
                instr_1511_tb= 5'd3; 
                alusrc_tb    = 1'b0; 
                regsdt_tb    = 1'b0; 
                alu_op_tb    = 2'b01;  // Subtraction
        
            #100                
              $finish;
            end     
endmodule
