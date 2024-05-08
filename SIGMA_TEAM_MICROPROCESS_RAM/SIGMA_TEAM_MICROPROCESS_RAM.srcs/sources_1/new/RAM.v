`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 11:37:26 AM
// Design Name: 
// Module Name: RAM
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


module RAM(
    input R_Wn, CLK,
    input [11:0] IN_Address,
    inout [15:0] Common_Bus_IN_OUT
);
   
    reg [15:0] temp_data;
    reg [15:0] memory_ram [255:0];

    initial begin
        $readmemh("X:/RAM.txt", memory_ram);
    end

    always @(posedge CLK) begin
        if(!R_Wn) begin
            memory_ram[IN_Address] <= Common_Bus_IN_OUT;
        end else begin
            temp_data <= memory_ram[IN_Address];
        end
    end
       
    assign Common_Bus_IN_OUT = R_Wn ?  temp_data : 'hzzzz;    
endmodule
