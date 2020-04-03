`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 12:51:04
// Design Name: 
// Module Name: number2seg
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


module number2seg(input clk , output [7:0] segs0 , segs1 ,segs2 , segs3 ,  input [15:0]countA , input [15:0]max );
    wire [15:0]number;
    assign number = (countA > max)?max:countA;
    
    numberscrollA A( .CLK(clk)  , .number(segs0), .counter(number%10) );
    numberscrollA B( .CLK(clk)   , .number(segs1), .counter(number%100 /10 ));
    numberscrollA C( .CLK(clk)   , .number(segs2), .counter(number% 1000 / 100) );
    numberscrollA D( .CLK(clk)   , .number(segs3), .counter(number%10000 /1000) );
endmodule
