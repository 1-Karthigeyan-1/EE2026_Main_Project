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

module drawRectangle(input sixclock, input [4:0] mode, input [6:0] x, input [6:0] y, input [15:0] GREEN,input [15:0] YELLOW,input [15:0] RED,input [15:0] BLACK,input [15:0] WHITE, output reg [15:0] oled_data);

    //13 x 3 pixel rectangles
    always @ (posedge sixclock) begin
        case (mode)
            0: begin
                oled_data <= BLACK;
            end
            1: begin
                if (x >= 42 && x <= 56 && y >= 55 && y <= 56) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            2: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53))) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            3: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50))) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            4: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47))) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            5: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44))) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            6: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            7: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && y >= 37 && y <= 38) begin
                oled_data <= YELLOW;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            8: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35))) begin
                oled_data <= YELLOW;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            9: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32))) begin
                oled_data <= YELLOW;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            10: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29))) begin
                oled_data <= YELLOW;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            11: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            12: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else if (x >= 42 && x <= 56 && y >= 22 && y <= 23) begin
                oled_data <= RED;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            13: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else if (x >= 42 && x <= 56 && ((y >= 22 && y <= 23) || (y >= 19 && y <= 20))) begin
                oled_data <= RED;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            14: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else if (x >= 42 && x <= 56 && ((y >= 22 && y <= 23) || (y >= 19 && y <= 20) || (y >= 16 && y <= 17))) begin
                oled_data <= RED;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            15: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else if (x >= 42 && x <= 56 && ((y >= 22 && y <= 23) || (y >= 19 && y <= 20) || (y >= 16 && y <= 17) || (y >= 13 && y <= 14))) begin
                oled_data <= RED;
                end
                else begin
                oled_data <= BLACK;
                end
            end
            16: begin
                if (x >= 42 && x <= 56 && ((y >= 55 && y <= 56) || (y >= 52 && y <= 53) || (y >= 49 && y <= 50) || (y >= 46 && y <= 47) || (y >= 43 && y <= 44) || (y >= 40 && y <= 41))) begin
                oled_data <= GREEN;
                end
                else if (x >= 42 && x <= 56 && ((y >= 37 && y <= 38) || (y >= 34 && y <= 35) || (y >= 31 && y <= 32) || (y >= 28 && y <= 29) || (y >= 25 && y <= 26))) begin
                oled_data <= YELLOW;
                end
                else if (x >= 42 && x <= 56 && ((y >= 22 && y <= 23) || (y >= 19 && y <= 20) || (y >= 16 && y <= 17) || (y >= 13 && y <= 14) || (y >= 10 && y <= 11))) begin
                oled_data <= RED;
                end
                else begin
                oled_data <= BLACK;
                end
            end
        endcase
    end
endmodule