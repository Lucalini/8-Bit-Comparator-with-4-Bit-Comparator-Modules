`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 05:07:26 PM
// Design Name: 
// Module Name: Eightbit
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


module Eightbit(
    input [7:0] A,
    input [7:0] B,
    output reg EQ,
    output reg GT,
    output reg LT
    );
    
    wire bgt, hlt, heq, lgt, llt, leq; 

    
    Fourbitcomparator high(
        .a (A[7:4]),
        .b (B[7:4]),
        .gt (hgt),
        .lt (hlt),
        .eq (heq)    );   
        
    Fourbitcomparator low(
        .a (A[3:0]),
        .b (B[3:0]),
        .gt (lgt),
        .lt (llt),
        .eq (leq)    );   
     
 
    always  @(*)
    begin
        if (hgt == 1)
        begin
            GT = 1; LT = 0; EQ = 0;
        end      

        else if (heq == 1 && leq ==1)
        begin
            GT = 0; LT = 0; EQ = 1;
        end
        
        else if (heq == 1'b1 && lgt == 1'b1) 
        begin
             GT = 1; LT = 0; EQ = 0;
        end
        
        else if (heq ==1 && llt ==1)
        begin
            GT = 0; LT = 1; EQ = 0;
        end
        

      end

endmodule
