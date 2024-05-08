`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 11:18:57 AM
// Design Name: 
// Module Name: ALU
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


module ALU (
input [15:0] Accumulator_in,
input [15:0] Data_in,
input [3:0] OP_code,
output reg [15:0] Accumulator_out,
output reg E
            );
 
reg [16:0] result;
            
always @* begin 
          if (OP_code == 4'b0000) begin
          Accumulator_out = Accumulator_in & Data_in;
          E = 1'b0;
                end
          else if(OP_code == 4'b0001) begin
          Accumulator_out =  Accumulator_in | Data_in;                         
          E = 1'b0;
                                    end
          else if(OP_code == 4'b0010) begin
          result  =  Accumulator_in + Data_in;
          E = result [16];
                                    end
         else if(OP_code == 4'b0011) begin
         result = Accumulator_in;
         E = 1'b0;
                                     end
         else if (OP_code == 4'b0100) begin
         result = ~Accumulator_in + 1;
         Accumulator_out = result[15:0];
         E = result[16];
                                      end
          end

endmodule
