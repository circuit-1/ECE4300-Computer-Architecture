`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2026 10:07:35 AM
// Design Name: 
// Module Name: signext_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module signext_decoder(
            input [15:0] immediate,
            output [31:0] extended
          );

      assign extended = {{16{immediate[15]}}, immediate}; 
      //             duplicates MSB 16 times, concats it to the beginning of immediate
     
endmodule
