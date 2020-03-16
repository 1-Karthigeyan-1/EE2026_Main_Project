`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 16:38:45
// Design Name: 
// Module Name: border
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

parameter BLACK = 16'b0000000000000000, WHITE = 16'b1111111111111111;
module border(input CLK100MHZ, input [1:0] mode, input [12:0] pixel_index, output reg [15:0] oled_data);
    wire [6:0] x;
    wire [6:0] y;
    coordinates coor(pixel_index, x , y);
    always @ (posedge CLK100MHZ) begin
        // 1 pixel border
        if (mode == 2'd1) begin
            if ((x == 0 || x == 95) || (y==0 || y==63)) begin
            oled_data <= WHITE; //WHITE
            end
            else begin
                oled_data <= BLACK; //BLACK
            end
        end
        // 3 pixel border
        if (mode == 2'd3) begin
            if (((x>= 0 && x <= 2) || (x >= 93 && x <= 95)) || ((y>= 0 && y <= 2) || (y>=61 && y <= 63))) begin
                oled_data <= WHITE; //WHITE
            end
            else begin
                oled_data <= BLACK; //BLACK
            end
        end 
    end
        
endmodule
