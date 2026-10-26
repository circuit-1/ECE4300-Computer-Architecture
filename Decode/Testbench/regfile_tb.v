module regfile_tb();

        reg clk_tb = 1, rst_tb, regwrite_tb; 
        reg [4:0] rs_tb, rt_tb, rd_tb; 
        reg [31:0] writedata_tb; 
        wire [31:0] A_readdata1_tb, B_readdata2_tb;
        
        regfile REGFILE_TB (
              .clk(clk_tb),
              .rst(rst_tb),
              .regwrite(regwrite_tb),
              .rs(rs_tb),
              .rt(rt_tb),
              .rd(rd_tb),
              .writedata(writedata_tb),
              .A_readdat1(A_readdata1_tb),
              .B_readdat2(B_readdata2_tb)
            );
            
        always 
            #5 clk_tb = ~clk_tb; 
        
        initial 
            begin
                rst_tb = 1; 
                regwrite_tb = 0; 
                rs_tb = 5'h16;
                rt_tb = 5'h3;
                rd_tb = 5'h1;
                writedata_tb = 32'h8120; 
             #50
                rst_tb = 0; 
             #50 
                regwrite_tb = 1; 
             #50 
                regwrite_tb = 0; 
                rs_tb = 5'h1; 
             #50 
                regwrite_tb = 1;
                writedata_tb = 32'h544653; 
                rd_tb = 5'h9; 
             #50
                regwrite_tb = 0; 
                writedata_tb = 32'h138; 
                rd_tb = 5'h10; 
             #50 
                regwrite_tb = 1; 
                writedata_tb = 32'h90; 
                rt_tb = 5'h9; 
             #50 
                regwrite_tb = 0; 
                rs_tb = 5'h9; 
                rt_tb = 5'h1; 
             #100
             $finish; 
             end

endmodule
