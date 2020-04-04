`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 14:27:35
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
    wire [15:0]number , digit1 , digit2 , digit3 , digit4;
    assign number = (countA > max)?max:countA;
    assign digit1 = number%10;
    assign  digit2 = (number%100) /10;
    assign digit3 = (number% 1000) /100;
    assign digit4 = (number%10000) /1000;
    numberscrollA A( .CLK(clk)  , .number(segs0), .counter(digit1) );
    numberscrollA B( .CLK(clk)   , .number(segs1), .counter(digit2 ));
    numberscrollA C( .CLK(clk)   , .number(segs2), .counter(digit3 ));
    numberscrollA D( .CLK(clk)   , .number(segs3), .counter(digit4) );
endmodule
