`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 23:01:20
// Design Name: 
// Module Name: red_color
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


module red_color(input sixclock, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,output reg [15:0] red_data);

    wire [15:0] R_data;
    wire [15:0] E_data;
    wire [15:0] D_data;
    reg [6:0] x1 =0;
    reg [6:0] y1 =0;
    reg [21:0] counter = 0;
    
    letters r(sixclock, x, y, x1, x1+4, y1, y1+9, 18, WHITE,GREEN,PINK,RED,BLACK, R_data); //R
    letters e(sixclock, x, y, x1+7, x1+11, y1, y1+9, 5, WHITE,GREEN,PINK,RED,BLACK, E_data); //E
    letters d(sixclock, x, y, x1+14, x1+18, y1, y1+9, 4, WHITE,GREEN,PINK,RED,BLACK, D_data); //D

    always @ (posedge sixclock) begin
        counter <= counter +1;
        x1 <= (counter == 0)? {x1[5:0], ~(x1[6] ^ x1[5])} % 77 : x1;
        y1 <= (counter == 0)? {y1[5:0], ~(y1[6] ^ y1[5])} % 54: y1;
        if (x>=x1 && x<=x1+4 && y>=y1 && y<=y1+9)
            red_data <= R_data;
        else if (x>=x1+7 && x<=x1+11 && y>=y1 && y<=y1+9)
            red_data <= E_data;
        else if (x>=x1+14 && x<=x1+18 && y>=y1 && y<=y1+9)
            red_data <= D_data;
        else
            red_data <= BLACK;
        end
        
endmodule
