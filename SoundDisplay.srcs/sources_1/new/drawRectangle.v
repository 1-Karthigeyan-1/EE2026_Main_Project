`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2020 09:56:42
// Design Name: 
// Module Name: drawRectangle
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

parameter GREEN = 16'b0000011111100000, YELLOW = 16'b1111111111100000, RED = 16'b1111100000000000;
module drawRectangle(input CLK100MHZ, input [1:0] mode, input [12:0] pixel_index, output reg [15:0] oled_data);
    wire [6:0] x;
    wire [6:0] y;
    coordinates coor(pixel_index, x , y);
    always @ (posedge CLK100MHZ) begin
        if (x >= 45 && x <= 50) begin
            oled_data <= GREEN; //WHITE
        end
        if (y >= 45 && x <= 50) begin
            oled_data <= GREEN; //WHITE
        end        
        else begin
            oled_data <= BLACK; //BLACK
        end
    end
endmodule