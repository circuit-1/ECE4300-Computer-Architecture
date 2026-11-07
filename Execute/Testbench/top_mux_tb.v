module top_mux_tb();

        reg [31:0] a_tb, b_tb; 
        wire [31:0] y_tb; 
        reg alusrc_tb; 

         top_mux TOP_MUX_TB (
                    .a(a_tb),
                    .b(b_tb),
                    .y(y_tb),
                    .alusrc(alusrc_tb)
                    );
        
        initial 
            begin 
                a_tb = 32'h28; 
                b_tb = 32'h81; 
                alusrc_tb = 0; 
             #50 
                a_tb = 32'h10; 
                alusrc_tb = 1; 
             #50 
                b_tb = 32'h192; 
             #50
                alusrc_tb = 0;
             #50
                alusrc_tb = 1; 
             #100 
                $finish;
            end
                    
endmodule
