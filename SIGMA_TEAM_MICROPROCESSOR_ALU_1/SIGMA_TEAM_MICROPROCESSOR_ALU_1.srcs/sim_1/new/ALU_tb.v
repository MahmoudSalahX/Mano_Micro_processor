`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 11:19:49 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
reg [15:0] Accumulator_in_tb;
reg [15:0] Data_in_tb;
reg [3:0] OP_code_tb;

wire [15:0] Accumulator_out_tb;
wire E_tb;
reg CLK_tb;
integer i,j,k;


ALU ALU_INST(.Accumulator_in(Accumulator_in_tb),
             .Data_in(Data_in_tb),
             .OP_code(OP_code_tb),
             .Accumulator_out(Accumulator_out_tb),
             .E(E_tb));

 always begin
       #5 CLK_tb = ~CLK_tb;
       end             
       
initial begin 
        CLK_tb = 0;
        Accumulator_in_tb = 16'h0000;
        Data_in_tb = 16'h0000;
        OP_code_tb = 4'b0000;
        
        for (i = 5; i < 16; i = i + 1) begin
             for(j = 0; j < 16; j = j + 1) begin
                for(k = 0; k < 5; k = k + 1)  begin
               Accumulator_in_tb = i;
               Data_in_tb = j ;
               OP_code_tb = k ;
               #10;
               
                                                end
                                            end
                                        end
        
        end
 

endmodule
