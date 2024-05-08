`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 01:42:43 PM
// Design Name: 
// Module Name: Registers_tb
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

module Registers_tb;

   
    reg CLK;
    reg LD_AC_tb,LD_DR_tb,LD_IR_tb,LD_TR_tb,LD_AR_tb,LD_PC_tb;
    reg CLR_AC_tb,CLR_DR_tb,CLR_IR_tb,CLR_TR_tb,CLR_AR_tb,CLR_PC_tb;
    reg INC_AC_tb,INC_DR_tb,INC_IR_tb,INC_TR_tb,INC_AR_tb,INC_PC_tb;
    reg [15:0] Accumulator_in_tb;
    reg [11:0] PC_in_tb;
    reg [11:0] Address_in_tb;
    reg [15:0] Temp_in_tb;
    reg [15:0] Instruction_in_tb;
    reg [15:0] Data_in_tb;
    
    
    wire [15:0] Accumulator_out_tb;
    wire [11:0] PC_out_tb;
    wire [11:0] Address_out_tb;
    wire [15:0] Temp_out_tb;
    wire [15:0] Instruction_out_tb;
    wire [15:0] Data_out_tb;
    
    
    Accumulator acc (
        .CLK(CLK), 
        .LD_AC(LD_AC_tb), 
        .CLR_AC(CLR_AC_tb), 
        .INC_AC(INC_AC_tb), 
        .Accumulator_in(Accumulator_in_tb), 
        .Accumulator_out(Accumulator_out_tb)
    );
    
    Program_Counter pc (
        .CLK(CLK), 
        .LD_PC(LD_PC_tb), 
        .CLR_PC(CLR_PC_tb), 
        .INC_PC(INC_PC_tb), 
        .PC_in(PC_in_tb), 
        .PC_out(PC_out_tb)
    );
    
    Address_Register ar (
        .CLK(CLK), 
        .LD_AR(LD_AR_tb), 
        .CLR_AR(CLR_AR_tb), 
        .INC_AR(INC_AR_tb), 
        .Address_in(Address_in_tb), 
        .Address_out(Address_out_tb)
    );
    
    Temporary_Register tr (
        .CLK(CLK), 
        .LD_TR(LD_TR_tb), 
        .CLR_TR(CLR_TR_tb), 
        .INC_TR(INC_TR_tb), 
        .Temp_in(Temp_in_tb), 
        .Temp_out(Temp_out_tb)
    );
    
    Instruction_Register ir (
        .CLK(CLK), 
        .LD_IR(LD_IR_tb), 
        .CLR_IR(CLR_IR_tb),
        .INC_IR(INC_IR_tb),
        .Instruction_in(Instruction_in_tb), 
        .Instruction_out(Instruction_out_tb)
    );
    
    Data_Register dr (
        .CLK(CLK), 
        .LD_DR(LD_DR_tb), 
        .CLR_DR(CLR_DR_tb), 
        .INC_DR(INC_DR_tb), 
        .Data_in(Data_in_tb), 
        .Data_out(Data_out_tb)
    );

  always begin 
         #5 CLK = ~CLK;
         end


    
    
    initial begin
    CLK =0;
//        CLR_PC_tb = 0;
//        INC_PC_tb = 0;
//        LD_PC_tb = 0;
//        CLR_AR_tb = 0;
//        INC_AR_tb = 0;
//        LD_AR_tb = 0;
        
        
        
//        Accumulator_in_tb = 0;
//        PC_in_tb = 0;
//        Address_in_tb = 0;
//        Temp_in_tb = 0;
//        Instruction_in_tb = 0;
//        Data_in_tb = 0;

 #10;
            #10 CLR_PC_tb = 1; 
            #10 CLR_PC_tb = 0; 
             LD_PC_tb = 1;  
            #10;
            #10 PC_in_tb = 12'h0FA;
            #10 LD_PC_tb = 0; 
            #10 INC_PC_tb = 1; 
            #10 INC_PC_tb = 0; 
           

             
            #10 CLR_AR_tb = 1; 
            #10 CLR_AR_tb = 0;
            #10 LD_AR_tb = 1;  
            #10 Address_in_tb = 12'h0F0;
            #10 LD_AR_tb = 0; 
            #10 INC_AR_tb = 1; 
            #10 INC_AR_tb = 0; 
        
            
            #10 CLR_DR_tb = 1; 
            #10 CLR_DR_tb = 0; 
            #10 LD_DR_tb = 1;  
            #10;
            #10 Data_in_tb = 16'h3C4D;
            #10 LD_DR_tb = 0; 
            #10 INC_DR_tb = 1; 
            #10 INC_DR_tb = 0;         
            
            
            #10 CLR_AC_tb = 1; 
            #10 CLR_AC_tb = 0; 
            #10 LD_AC_tb = 1;  
            #10;
            #10 Accumulator_in_tb = 16'hA5A5;
            #10 LD_AC_tb = 0; 
            #10 INC_AC_tb = 1; 
            #10 INC_AC_tb = 0; 
            
            
            #10 CLR_IR_tb = 1; 
            #10 CLR_IR_tb = 0; 
            #10 LD_IR_tb = 1;  
            #10;
            #10 Instruction_in_tb = 16'h1A2B;
            #10 LD_IR_tb = 0; 
            #10 INC_IR_tb = 1; 
            #10 INC_IR_tb = 0;  
            
            #10 CLR_TR_tb = 1; 
            #10 CLR_TR_tb = 0; 
            #10 LD_TR_tb = 1;  
            #10;
            #10 Temp_in_tb = 16'h5A5A;
            #10 LD_TR_tb = 0; 
            #10 INC_TR_tb = 1; 
            #10 INC_TR_tb = 0;          
  
       
    end
      
endmodule

