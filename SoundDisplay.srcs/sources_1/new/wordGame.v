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


module wordGame(input CLK100MHZ, input sixclock, input [12:0] pixel_index, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,BLUE, input up, down, left, right, reset, output reg [15:0] wordgamedata, output reg [10:0] score = 0);
wire [15:0] blue_data;
wire [15:0] red_data;
wire [15:0] green_data;
wire [15:0] pink_data;
reg [22:0] counter = 0;
reg [17:0] button_counter = 0;
reg [3:0] word;
reg [1:0] background_color;
reg [15:0] COLOR = 16'b0000011111100000; //start with green
reg correctflag =0;
parameter NOINPUT = 0, CORRECT = 1, WRONG = 2;
parameter BLUE_WORD = 0, RED_WORD = 1, GREEN_WORD = 2, PINK_WORD = 3, CORRECT_SCREEN = 4, WRONG_SCREEN = 5, END_SCREEN = 6;
reg [22:0] ver_speed = 0;
reg [22:0] speed1 = 0;
reg [21:0] speed2 = 0;
reg [20:0] speed3 = 0;
reg [19:0] speed4 = 0;
reg [18:0] speed5 = 0;
reg endflag = 0;
wire clkp5;
wire [1:0]random_word;
wire [1:0]random_color;
wire [15:0] correct_data;
wire [15:0] wrong_data;
wire [15:0] over_data;

screen1 screens(sixclock, pixel_index, correct_data, wrong_data, over_data);

clock_divider clkp5hz(CLK100MHZ , 6249999 , clkp5);


rng_gen word_gen(clkp5 ,random_word);
rng_gen color_gen(sixclock ,random_color);

blue_color blue(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,blue_data);
red_color red(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,red_data);
green_color green(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,green_data);
pink_color pink(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,pink_data);
always @ (posedge sixclock) begin
//    wordgamedata <= pixel_data; //picture

//    counter <= counter + 1; //to be removed
    button_counter <= button_counter+1;
// change speed of the intervals
    if (word == CORRECT_SCREEN || word == WRONG_SCREEN) begin
        ver_speed <= ver_speed + 1;
        counter <= ver_speed;
    end
    else begin
        if (score <= 2) begin
            speed1 <= speed1 + 1;
            counter <= speed1;
        end
        else if (score>= 3 && score <=4) begin
            speed2 <= speed2 + 1;
            counter <= speed2;
        end
        else if (score>= 5 && score <=6) begin
            speed3 <= speed3 + 1;
            counter <= speed3;
        end
        else if (score>= 7 && score <=8) begin
            speed4 <= speed4 + 1;
            counter <= speed4;
        end
        else if (score>= 9 && score <=11) begin
            speed5 <= speed5 + 1;
            counter <= speed5;
        end
        else if (score>= 12)
            endflag <= 1;
    end
    
    word <= (counter==0)? random_word%4 : word; //picks a random word
    background_color <= (counter==0)? random_color%4 : background_color; //picks a random background color

    // up - GREEN
    // down - RED
    // left - BLUE
    // right - PINK
    case (word)
        BLUE_WORD:
        begin
            wordgamedata <= blue_data;
            if (up==0 && down==0 && left==1 && right==0 && button_counter == 0)
                correctflag = CORRECT; //correct answer
            else if(up || down || right) begin
                correctflag = WRONG; //wrong answer
            end
//            else
//                correctflag = NOINPUT; //no input
        end
        RED_WORD:
        begin
            wordgamedata <= red_data;
            if (up==0 && down==1 && left==0 && right==0 && button_counter == 0)
                correctflag = CORRECT; //correct answer
            else if(up || left || right) begin
                correctflag = WRONG; //wrong answer
            end
//            else
//                correctflag = NOINPUT; //no input
        end
        GREEN_WORD:
        begin
            wordgamedata <= green_data;
            if (up==1 && down==0 && left==0 && right==0 && button_counter == 0)
                correctflag = CORRECT; //correct answer
            else if(down || left || right) begin
                correctflag = WRONG; //wrong answer
            end
//            else
//                correctflag = NOINPUT; //no input
        end
        PINK_WORD:
        begin
            wordgamedata <= pink_data;
            if (up==0 && down==0 && left==0 && right==1 && button_counter == 0)
                correctflag = CORRECT; //correct answer
            else if(down || left || up) begin
                correctflag = WRONG; //wrong answer
            end
//            else
//                correctflag = NOINPUT; //no input
        end
        CORRECT_SCREEN:
        begin
            wordgamedata <= correct_data; //Ans is correct so screen is green for 1 cycle
        end
        WRONG_SCREEN:
        begin
            wordgamedata <= wrong_data; //Ans is wrong so screen is red for 1 cycle
        end
        END_SCREEN:
        begin
            wordgamedata <= over_data;
        end
    endcase
    
    //change color of background, shpuld have another random value
    case (background_color)
        0:COLOR <= GREEN;
        1:COLOR <= PINK;
        2:COLOR <= BLUE;
        3:COLOR <= RED;
    endcase
    
    // Checks if answer is correct
    if(correctflag == CORRECT && counter != 0 && word!= CORRECT_SCREEN) begin //answer is correct with time remaining
        score <= score + 1;
        word <= CORRECT_SCREEN;
        ver_speed <= 1;
        counter <= ver_speed;
        correctflag = NOINPUT;
    end
    else if (correctflag == WRONG && counter != 0 && word!= WRONG_SCREEN) begin //answer wrong
        score <= score + 2;
        word <= WRONG_SCREEN;
        ver_speed <= 1;
        counter <= ver_speed;
        correctflag = NOINPUT;
    end
//    else if (correctflag == TIMEOUT && word!= WRONG_SCREEN) begin //time ran out
//        score <= score + 3;
//        word <= WRONG_SCREEN;
//        ver_speed <= 1;
//        correctflag = NOINPUT;
//    end

    if (endflag) begin
        if (reset && button_counter == 0) begin //restart game
            endflag <= 0;
            score <= 0;
            counter <= 1;
            speed1 <= 1;
            speed2 <= 1;
            speed3 <= 1;
            speed4 <= 1;
            speed5 <= 1;
            ver_speed <= 1;
            correctflag = NOINPUT;
            word<= BLUE_WORD;
        end
        else begin
            word <= END_SCREEN;
            correctflag = NOINPUT;
        end
    end
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
