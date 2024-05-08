`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 11:38:09 AM
// Design Name: 
// Module Name: RAM_TB
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

module RAM_TB1;

reg R_Wn_tb , CLK_tb;
reg [11:0] IN_Address_tb;
wire [15:0] Common_Bus_IN_OUT_tb;

reg [15:0] DataIN_tb;

RAM RAM_INST(.CLK(CLK_tb),
             .R_Wn(R_Wn_tb),
             .IN_Address(IN_Address_tb),
             .Common_Bus_IN_OUT(Common_Bus_IN_OUT_tb)  
             );
             
always begin
       #5 CLK_tb = ~CLK_tb;
       end
       
assign Common_Bus_IN_OUT_tb = !R_Wn_tb ? DataIN_tb :'hzzzz ;       
       
initial begin
        CLK_tb =0;
        R_Wn_tb =1;
        
//      DataIN_tb = 0;
//      IN_Address_tb= 0;

//        #10 R_Wn_tb = 0; 
//        #10 R_Wn_tb = 1 ;
             
        #10 IN_Address_tb = 0;
        
        #10 IN_Address_tb = 1;
        
        #10 IN_Address_tb = 2;
                
        #10 IN_Address_tb = 3;        

        #10 IN_Address_tb = 4;        

        
        
        
//        #10 R_Wn_tb = 0;
//        #10 R_Wn_tb = 1;       
        
        
         forever begin 
         
        #10 IN_Address_tb =1 ; R_Wn_tb =0;    DataIN_tb = 16'hB7BC;
        #10 IN_Address_tb =2 ;               DataIN_tb = 16'h0123;
        #10 IN_Address_tb =3 ;               DataIN_tb = 16'h4567;
        #10 IN_Address_tb =4 ;               DataIN_tb = 16'h89ab; 
         
        
        
          
        #10 IN_Address_tb = 1;  R_Wn_tb =1 ;
        #10 IN_Address_tb = 2;      
        #10 IN_Address_tb = 3;        
        #10 IN_Address_tb = 4;        


        end
        end
        
        
    
endmodule
