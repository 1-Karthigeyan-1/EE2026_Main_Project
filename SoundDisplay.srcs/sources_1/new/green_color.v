`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2020 00:41:09
// Design Name: 
// Module Name: green_color
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


module green_color(input clk6p25m, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,output reg [15:0] green_data);
    
    wire [15:0] G_data;
    wire [15:0] R_data;
    wire [15:0] E1_data;
    wire [15:0] E2_data;
    wire [15:0] N_data;
    reg [6:0] x1 =0;
    reg [6:0] y1 =0;
    reg [21:0] counter = 0;
    letters g(clk6p25m, x, y, x1, x1+4, y1, y1+9, 7, WHITE,GREEN,PINK,RED,BLACK, G_data); //G
    letters r(clk6p25m, x, y, x1+7, x1+11, y1, y1+9, 18, WHITE,GREEN,PINK,RED,BLACK, R_data); //R
    letters e1(clk6p25m, x, y, x1+14, x1+18, y1, y1+9, 5, WHITE,GREEN,PINK,RED,BLACK, E1_data); //E
    letters e2(clk6p25m, x, y, x1+21, x1+25, y1, y1+9, 5, WHITE,GREEN,PINK,RED,BLACK, E2_data); //E
    letters n(clk6p25m, x, y, x1+28, x1+37, y1, y1+9, 14, WHITE,GREEN,PINK,RED,BLACK, N_data); //N

    always @ (posedge clk6p25m) begin
        counter <= counter +1;
        x1 <= (counter == 0)? {x1[5:0], ~(x1[6] ^ x1[5])} % 58 : x1;
        y1 <= (counter == 0)? {y1[5:0], ~(y1[6] ^ y1[5])} % 54: y1;
        if (x>=x1 && x<=x1+4 && y>=y1 && y<=y1+9)
            green_data <= G_data;
        else if (x>=x1+7 && x<=x1+11 && y>=y1 && y<=y1+9)
            green_data <= R_data;
        else if (x>=x1+14 && x<=x1+18 && y>=y1 && y<=y1+9)
            green_data <= E1_data;
        else if (x>=x1+21 && x<=x1+25 && y>=y1 && y<=y1+9)
            green_data <= E2_data;
        else if (x>=x1+28 && x<=x1+37 && y>=y1 && y<=y1+9)
            green_data <= N_data;
        else
            green_data <= BLACK;
        end
        
endmodule
