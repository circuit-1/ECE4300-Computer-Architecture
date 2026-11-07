module ex_mem_tb();

        reg clk_tb = 1; 
        reg [1:0] ctlwb_out_tb; 
        reg [2:0] ctlm_out_tb; 
        reg [31:0] adder_out_tb, aluout_tb, readdat2_tb; 
        reg aluzero_tb;
        reg [4:0] muxout_tb; 
        wire [1:0] wb_ctlout_tb; 
        wire [2:0] mem_ctlout_tb; 
        wire [31:0] add_result_tb, alu_result_tb, rdata2out_tb;
        wire zero_tb; 
        wire [6:0] five_bit_muxout_tb;

        ex_mem EX_MEM_TB (
                    .clk(clk_tb),
                    .ctlwb_out(ctlwb_out_tb),
                    .ctlm_out(ctlm_out_tb),
                    .adder_out(adder_out_tb),
                    .aluzero(aluzero_tb),
                    .aluout(aluout_tb),
                    .readdat2(readdat2_tb),
                    .muxout(muxout_tb),
                    .wb_ctlout(wb_ctlout_tb),
                    .mem_ctlout(mem_ctlout_tb),
                    .add_result(add_result_tb),
                    .zero(zero_tb),
                    .alu_result(alu_result_tb),
                    .rdata2out(rdata2out_tb),
                    .five_bit_muxout(five_bit_muxout_tb)
                    );
                    
         always 
            #5 clk_tb = ~clk_tb; 
         
         initial 
            begin 
                ctlwb_out_tb = 2'b01; 
                ctlm_out_tb = 3'b101; 
                adder_out_tb = 32'h123; 
                aluzero_tb = 1'b1; 
                aluout_tb = 32'h82; 
                readdat2_tb = 32'h982; 
                muxout_tb = 5'd8;
             #50 
                ctlwb_out_tb = 2'b10; 
                ctlm_out_tb = 3'b111; 
                adder_out_tb = 32'h13; 
                aluzero_tb = 1'b0; 
                aluout_tb = 32'h8; 
                readdat2_tb = 32'h82; 
                muxout_tb = 5'd1;
             #50
                ctlwb_out_tb = 2'b11; 
                ctlm_out_tb = 3'b001; 
                adder_out_tb = 32'h624; 
                aluzero_tb = 1'b0; 
                aluout_tb = 32'h94; 
                readdat2_tb = 32'h13; 
                muxout_tb = 5'd4;
            #100
                $finish;              
            end           
                    
endmodule
