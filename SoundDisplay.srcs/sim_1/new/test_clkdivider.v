`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 15:07:08
// Design Name: 
// Module Name: test_clkdivider
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


module test_clkdivider();
reg basys_clock= 0;
wire cd_out;
clock_divider divider(basys_clock, cd_out);
    always begin
    basys_clock = ~basys_clock; #5;
    end
endmodule
