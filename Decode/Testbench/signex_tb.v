module signex_tb();

         reg [15:0] immediate_tb;
         wire [31:0] extended_tb;
         signex SIGNEX_TB (
                .immediate(immediate_tb),
                .extended(extended_tb)
              );
         
         initial
            begin 
                immediate_tb = 16'h1024; 
             #50
                immediate_tb = 16'h355;
             #50
                immediate_tb = -16'h983;
             #100
             $finish;
            end     
              
              
endmodule
