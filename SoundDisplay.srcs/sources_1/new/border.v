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


module border(input CLK100MHZ, input mode, input [6:0] x, input [6:0] y, output reg [15:0] oled_data);
    always @ (posedge CLK100MHZ) begin
        // 1 pixel border
        if (mode == 0) begin
            if ((x == 0 || x == 95) || (y==0 || y==63)) begin
                oled_data <= WHITE;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        // 3 pixel border
        if (mode == 1) begin
            if (((x>= 0 && x <= 2) || (x >= 93 && x <= 95)) || ((y>= 0 && y <= 2) || (y>=61 && y <= 63))) begin
                oled_data <= WHITE;
            end
            else begin
                oled_data <= BLACK;
            end
        end 
    end
        
endmodule
