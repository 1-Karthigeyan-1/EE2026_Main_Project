`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 19:36:26
// Design Name: 
// Module Name: oled_main
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


module oled_main(input CLK100MHZ, input sixclock, input [15:0] sw , input [15:0] soundlevel, input [12:0] pixel_index, input up, down, left, right, reset, output reg [15:0] oled_data, output reg [2:0] lives , input [4:0]balloon_state,
                  output [7:0] segs0 , segs1 , segs2, segs3);
    wire [6:0] x;
    wire [6:0] y;
    wire [15:0] wordgamedata;
    wire [15:0] graphdata;
    reg [15:0] z = 0;
    reg [15:0] GREEN = 16'b0000011111100000;
    reg [15:0] YELLOW = 16'b1111111111100000;
    reg [15:0] PINK = 16'b1111100000011111;
    reg [15:0] RED = 16'b1111100000000000;
    reg [15:0] BLACK = 16'b0000000000000000;
    reg [15:0] WHITE = 16'b1111111111111111;
    reg [15:0] BLUE = 16'b0000000000011111;
    reg word_start = 0;
    reg covid_start = 0;    
    wire [2:0] wlives;
    wire [15:0] covid_data;
    wire [15:0]mem_data;
    wire [12:0] balloon_data;
    reg mem_start = 0;
    reg sw8;
    coordinates coor(pixel_index, x , y);
    drawRectangle rect(sixclock,soundlevel, x, y,GREEN,YELLOW,RED,BLACK,WHITE, graphdata);
    wordGame word(CLK100MHZ,sixclock,sw,word_start,pixel_index, x,y,WHITE,GREEN,PINK,RED,BLACK,BLUE,up,down,left,right,reset,wordgamedata, wlives);
    covid_main cov(sixclock,covid_start, soundlevel, pixel_index, covid_data , segs0 , segs1 , segs2 , segs3);
    memory_game memory(sixclock, pixel_index, mem_start,right, x, y, GREEN,YELLOW,RED,BLACK,WHITE, soundlevel,mem_data);
    balloon_screen_main balloon(sixclock,x,y,YELLOW,BLACK,balloon_state , pixel_index, balloon_data );
    always @ (posedge sixclock) begin
        if (sw[13] == 1) begin
            GREEN = 16'b0000011111111111; //Cyan
            YELLOW = 16'b1111111111111111; //White
            RED = 16'b1111100000011111; //Pink
            BLACK = 16'b0000000000011111; //Blue
            WHITE = 16'b1111100000000000; //Red
        end
        if (sw[12] == 1) begin
            GREEN = 16'b1111100000011111; //Pink
            YELLOW = 16'b1111100000000000; //Red
            RED = 16'b0000000000011111; //Blue
            BLACK = 16'b1111111111111111; //White
            WHITE = 16'b0000000000011111; //Blue
        end
        if (sw[13] == 0 && sw[12] == 0) begin
            GREEN = 16'b0000011111100000;
            YELLOW = 16'b1111111111100000;
            RED = 16'b1111100000000000;
            BLACK = 16'b0000000000000000;
            WHITE = 16'b1111111111111111;
        end
        //word game activated
        if (sw[1] == 1) begin
            word_start <= 1;
            oled_data <= wordgamedata;
            lives <= wlives;
        end
        //covid gallery activated
        if (sw[2] == 1) begin
            covid_start <= 1;
            oled_data <= covid_data;
        end
        //memory game activated
        if (sw[3] == 1) begin
            mem_start <= 1;
            oled_data <= mem_data;
        end
        //balloon game activated
        if (sw[8] == 1) begin
            oled_data <= balloon_data;
        end
        //reset word-game
        if (sw[1] == 0) begin
            word_start <= 0;
        end
        //reset covid gallery
        if (sw[2] == 0) begin
            covid_start <= 0;
        end
        //reset mem game
        if (sw[3] == 0) begin
            mem_start <= 0;
        end
        if (sw[1] == 0 && sw[2] == 0 && sw[3] == 0 && sw[8] == 0) begin
            //1 pixel border
            if ((x == 0 || x == 95) || (y==0 || y==63)) begin
                if(sw[14] == 0)
                    oled_data <= WHITE;
                else //turn off border
                    oled_data <= BLACK;
            end
            //3 pixel border
            else if (((x>= 1 && x <= 2) || (x >= 93 && x <= 94)) || ((y>= 1 && y <= 2) || (y>=61 && y <= 62))) begin
                if(sw[14] == 0 && sw[15] == 1)
                    oled_data <= WHITE;
                else //turn off border
                    oled_data <= BLACK;
            end
            //soundbar
            else if (x >= 42 && x <= 56 && y >= 10 && y <= 56)
                oled_data <= graphdata;
            //all other cases
            else
                oled_data <= BLACK;
        end
    end
endmodule
