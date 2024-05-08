`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 01:40:54 PM
// Design Name: 
// Module Name: Accumulator
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

module Accumulator(
    input CLK, LD_AC, CLR_AC, INC_AC,
    input [15:0] Accumulator_in,
    output [15:0] Accumulator_out
);
    reg [15:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_AC) begin
            reg_data <= 16'h0000;
        end else if (LD_AC) begin
            reg_data <= Accumulator_in;
        end else if (INC_AC) begin
            reg_data <= reg_data + 1;
        end
    end
    assign Accumulator_out = reg_data;
endmodule

module Data_Register(
    input CLK, LD_DR, CLR_DR, INC_DR,
    input [15:0] Data_in,
    output [15:0] Data_out
);
    reg [15:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_DR) begin
            reg_data <= 16'h0000;
        end else if (LD_DR) begin
            reg_data <= Data_in;
        end else if (INC_DR) begin
            reg_data <= reg_data + 1;
        end
    end
    assign Data_out = reg_data;
endmodule

module Instruction_Register(
    input CLK, LD_IR,CLR_IR,INC_IR,
    input [15:0] Instruction_in,
    output [15:0] Instruction_out
);
    reg [15:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_IR) begin
            reg_data <= 16'h0000;
        end else if(LD_IR)begin
             reg_data <= Instruction_in;     
        end else if(INC_IR) begin          
            reg_data <= reg_data +1 ;
        end
        
    end
    assign Instruction_out = reg_data;
endmodule


module Temporary_Register(
    input CLK, LD_TR, CLR_TR, INC_TR,
    input [15:0] Temp_in,
    output [15:0] Temp_out
);
    reg [15:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_TR) begin
            reg_data <= 16'h0000;
        end else if (LD_TR) begin
            reg_data <= Temp_in;
        end else if (INC_TR) begin
            reg_data <= reg_data + 1;
        end
    end
    assign Temp_out = reg_data;
endmodule



//////////////////16-bit Registers///////////////////////////


module Address_Register(
    input CLK, LD_AR, CLR_AR, INC_AR,
    input [11:0] Address_in,
    output [11:0] Address_out
);
    reg [11:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_AR) begin
            reg_data <= 12'h000;
        end else if (LD_AR) begin
            reg_data <= Address_in;
        end else if (INC_AR) begin
            reg_data <= reg_data + 1;
        end
    end
    assign Address_out = reg_data;
endmodule

module Program_Counter(
    input CLK, LD_PC, CLR_PC, INC_PC,
    input [11:0] PC_in,
    output [11:0] PC_out
);
    reg [11:0] reg_data;
    always @(posedge CLK) begin
        if (CLR_PC) begin
            reg_data <= 12'h000;
        end else if (LD_PC) begin
            reg_data <= PC_in;
        end else if (INC_PC) begin
            reg_data <= reg_data + 1;
        end
    end
    assign PC_out = reg_data;
endmodule

//////////////////12-bit Registers///////////////////////////