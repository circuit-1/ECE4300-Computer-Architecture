module bottom_mux_tb();

        reg [4:0] a_tb, b_tb; 
        wire [4:0] y_tb; 
        reg sel_tb; 

         bottom_mux BOTTOM_MUX_TB (
                    .a(a_tb),
                    .b(b_tb),
                    .y(y_tb),
                    .sel(sel_tb)
                    );
        
        initial 
            begin 
                a_tb = 5'd9; 
                b_tb = 5'd2; 
                sel_tb = 0; 
             #50 
                a_tb = 5'd12; 
                sel_tb = 1; 
             #50 
                b_tb = 5'd27; 
             #50
                sel_tb = 0;
             #50
                sel_tb = 1; 
             #100 
                $finish;
            end
                    
endmodule
