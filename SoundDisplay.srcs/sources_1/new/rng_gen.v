`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2020 22:19:05
// Design Name: 
// Module Name: rng_gen
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


module rng_gen(input clkp5 , output reg [7:0] actual);
reg [20:0] number = 0;
always@(posedge clkp5)
    begin
    number <= {number[19:0] , ~(number[20] ^ number[19])};
    actual <= number % 77;
    end
endmodule
