module adder_tb();

        reg [31:0] add_in1_tb, add_in2_tb; 
        wire [31:0] add_out_tb; 

        adder ADDER_TB (
                    .add_in1(add_in1_tb),
                    .add_in2(add_in2_tb),
                    .add_out(add_out_tb)
                    );
        
        initial 
            begin 
                add_in1_tb = 32'h23; 
                add_in2_tb = 32'h123;
            #50 
                add_in1_tb = 32'h982;
                add_in2_tb = 32'h0238; 
            #50 
                add_in1_tb = 32'h913;
                add_in2_tb = 32'h9; 
            #100
                $finish;     
            end            
                    
                    
endmodule
