`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2020 23:03:37
// Design Name: 
// Module Name: wordGame
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


module wordGame(input sixclock, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,YELLOW,RED,BLACK,output reg [15:0] wordgamedata);
wire [15:0] blue_data;
wire [15:0] red_data;
wire [15:0] green_data;
reg [30:0] counter = 0;
reg [5:0] random = 5;
reg [2:0] word;

blue_color(sixclock,x,y,WHITE,GREEN,YELLOW,RED,BLACK,blue_data);
red_color(sixclock,x,y,WHITE,GREEN,YELLOW,RED,BLACK,red_data);
green_color(sixclock,x,y,WHITE,GREEN,YELLOW,RED,BLACK,green_data);
always @ (posedge sixclock) begin
    counter <= counter +1;
    random <= random + 5;
    word <= (counter == 0)? {random[5:0], random[4] ^ random[2]} % 3 : word;
    case (word)
        0:wordgamedata = blue_data;
        1:wordgamedata = red_data;
        2:wordgamedata = green_data;
//        3:wordgamedata = pink_data;
    endcase
end
/*
    reg [6:0] x1 = 2;
    reg [6:0] x2 = 6;
    reg [6:0] y1 = 13;
    reg [6:0] y2 = 22;
    reg [4:0] letter = 3;
    wire [15:0] C_data;
    wire [15:0] H_data;
    wire [15:0] O1_data;
    wire [15:0] O2_data;
    wire [15:0] S_data;
    wire [15:0] E_data;
    
    letters(sixclock, x, y, 2, 6, 13, 22, 3, WHITE,GREEN,YELLOW,RED,BLACK, C_data); //C
    letters(sixclock, x, y, 9, 13, 13, 22, 8, WHITE,GREEN,YELLOW,RED,BLACK, H_data); //H
    letters(sixclock, x, y, 16, 20, 13, 22, 15, WHITE,GREEN,YELLOW,RED,BLACK, O1_data); //O
    letters(sixclock, x, y, 23, 27, 13, 22, 15, WHITE,GREEN,YELLOW,RED,BLACK, O2_data); //O
    letters(sixclock, x, y, 30, 34, 13, 22, 19, WHITE,GREEN,YELLOW,RED,BLACK, S_data); //S
    letters(sixclock, x, y, 37, 41, 13, 22, 5, WHITE,GREEN,YELLOW,RED,BLACK, E1_data); //E
    
    letters(sixclock, x, y, 37, 41, 13, 22, 5, WHITE,GREEN,YELLOW,RED,BLACK, E2_data); //E
    
    always @ (posedge sixclock) begin
        if (x>=2 && x<=6 && y>=13 && y<=22) begin
            wordgamedata = C_data;
        end
        else if (x>=9 && x<=13 && y>=13 && y<=22) begin
            wordgamedata = H_data;
        end
        else if (x>=16 && x<=20 && y>=13 && y<=22) begin
            wordgamedata = O1_data;
        end
        else if (x>=23 && x<=27 && y>=13 && y<=22) begin
            wordgamedata = O2_data;
        end
        else if (x>=30 && x<=34 && y>=13 && y<=22) begin
            wordgamedata = S_data;
        end
        else if (x>=37 && x<=41 && y>=13 && y<=22) begin
            wordgamedata = E_data;
        end
        else begin
            wordgamedata = BLACK;
        end
    end
*/
endmodule
