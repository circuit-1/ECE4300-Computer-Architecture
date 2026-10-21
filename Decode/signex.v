module signEx (
  input [15:0] immediate,
  output [31:0] extended
  );

  assign extended = {{16{immediate[15]}}, immediate}; 
  //             duplicates msb 16 times, concats it to the beginning of immediate
  
endmodule
