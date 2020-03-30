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


module wordGame(input sixclock, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,BLUE, input up, down, left, right,output reg [15:0] wordgamedata, output reg [10:0] score = 0);
wire [15:0] blue_data;
wire [15:0] red_data;
wire [15:0] green_data;
wire [15:0] pink_data;
reg [40:0] counter = 0;
reg [17:0] button_counter = 0;
reg [5:0] random = 5;
reg [2:0] word;
reg [15:0] COLOR = 16'b0000011111100000; //start with green

blue_color blue(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,blue_data);
red_color red(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,red_data);
green_color green(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,green_data);
pink_color pink(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,pink_data);
always @ (posedge sixclock) begin
    counter <= counter +1;
    button_counter <= button_counter+1;
    random <= random + 5;
    word <= (counter == 0)? {random[5:0], random[4] ^ random[2]} % 4 : word;
    
    // up - GREEN
    // down - RED
    // left - BLUE
    // right - PINK
    case (word)
        0:
        begin
            wordgamedata = blue_data;
            if (up==0 && down==0 && left==1 && right==0 && button_counter == 0)begin
                score <= score + 1;
            end
        end
        1:
        begin
            wordgamedata = red_data;
            if (up==0 && down==1 && left==0 && right==0 && button_counter == 0)begin
                score <= score + 1;
            end
        end
        2:
        begin
            wordgamedata = green_data;
            if (up==1 && down==0 && left==0 && right==0 && button_counter == 0)begin
                score <= score + 1;
            end
        end
        3:
        begin
            wordgamedata = pink_data;
            if (up==0 && down==0 && left==0 && right==1 && button_counter == 0)begin
                score <= score + 1;
            end
        end
    endcase
    case (word)
        0:COLOR = GREEN;
        1:COLOR = RED;
        2:COLOR = BLUE;
        3:COLOR = PINK;
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
