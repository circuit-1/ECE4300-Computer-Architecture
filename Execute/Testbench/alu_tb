module alu_tb();

        reg [31:0] a_tb, b_tb; 
        reg [2:0] control_tb; 
        wire [31:0] result_tb; 
        wire zero_tb; 

        ALU ALU_TB (
                    .a(a_tb),
                    .b(b_tb),
                    .control(control_tb),
                    .result(result_tb),
                    .zero(zero_tb)
                    );
       
        initial 
            begin 
                a_tb = 32'h12938; 
                b_tb = 32'h19; 
                control_tb = 3'b110; //sub
            #50 
                a_tb = 32'h983; 
                b_tb = 32'h98; 
                control_tb = 3'b000; //and
            #50 
                a_tb = 32'h123; 
                b_tb = 32'h10; 
                control_tb = 3'b001; //or
            #50 
                a_tb = 32'h09; 
                b_tb = 32'h19; 
                control_tb = 3'b111; //stl
            #50 
                a_tb = 32'h01; 
                b_tb = 32'h03; 
                control_tb = 3'b010; // add
            #100
                $finish; 
            end             
                    
                    
endmodule
