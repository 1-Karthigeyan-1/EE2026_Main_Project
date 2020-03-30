`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2020 13:59:54
// Design Name: 
// Module Name: pink_color
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


module pink_color(input sixclock, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,output reg [15:0] green_data);
    
    wire [15:0] P_data;
    wire [15:0] I_data;
    wire [15:0] N_data;
    wire [15:0] K_data;
    reg [6:0] x1 =1;
    reg [6:0] y1 =1;
    reg [21:0] counter = 0;
    letters p(sixclock, x, y, x1, x1+4, y1, y1+9, 16, WHITE,GREEN,PINK,RED,BLACK, P_data); //P
    letters i(sixclock, x, y, x1+7, x1+11, y1, y1+9, 9, WHITE,GREEN,PINK,RED,BLACK, I_data); //I
    letters n(sixclock, x, y, x1+14, x1+23, y1, y1+9, 14, WHITE,GREEN,PINK,RED,BLACK, N_data); //N
    letters k(sixclock, x, y, x1+26, x1+35, y1, y1+9, 11, WHITE,GREEN,PINK,RED,BLACK, K_data); //K

    always @ (posedge sixclock) begin
        counter <= counter +1;
        x1 <= (counter == 0)? {x1[3:0], x1[4] ^ x1[2]} % 65 : x1;
        y1 <= (counter == 0)? {y1[5:0], y1[5] ^ y1[1]} % 54: y1;
        if (x>=x1 && x<=x1+4 && y>=y1 && y<=y1+9)
            green_data <= P_data;
        else if (x>=x1+7 && x<=x1+11 && y>=y1 && y<=y1+9)
            green_data <= I_data;
        else if (x>=x1+14 && x<=x1+23 && y>=y1 && y<=y1+9)
            green_data <= N_data;
        else if (x>=x1+26 && x<=x1+35 && y>=y1 && y<=y1+9)
            green_data <= K_data;
        else
            green_data <= BLACK;
        end
        
endmodule
