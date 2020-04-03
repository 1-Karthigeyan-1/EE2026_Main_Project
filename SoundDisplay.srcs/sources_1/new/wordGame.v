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


module wordGame(input CLK100MHZ, input sixclock, input [15:0]sw, input word_start,input [12:0] pixel_index, input [6:0] x, input [6:0] y, input [15:0] WHITE,GREEN,PINK,RED,BLACK,BLUE, input up, down, left, right, reset, output reg [15:0] wordgamedata, output reg [2:0] lives);
wire [15:0] blue_data;
wire [15:0] red_data;
wire [15:0] green_data;
wire [15:0] pink_data;
reg [3:0] score = 0;
reg [30:0] counter = 0;
reg [17:0] button_counter = 0;
reg [3:0] word;
reg [1:0] background_color;
reg [15:0] COLOR = 16'b0000011111100000; //start with green
reg correctflag =0;
parameter NOINPUT = 0, CORRECT = 1, WRONG = 2;
parameter BLUE_WORD = 0, RED_WORD = 1, GREEN_WORD = 2, PINK_WORD = 3, CORRECT_SCREEN = 4, WRONG_SCREEN = 5, END_SCREEN = 6;
reg [22:0] ver_speed = 0;
reg [25:0] speed1 = 0;
reg [23:0] speed2 = 0;
reg [22:0] speed3 = 0;
reg [21:0] speed4 = 0;
reg [20:0] speed5 = 0;
reg endflag = 0;
reg startflag = 0;
reg [2:0] startscreens = 0;
reg [24:0] fivesec = 0;
wire clkp5;
wire [1:0]random_word;
wire [1:0]random_color;

wire [15:0] title_data;
wire [15:0] instructions_data;
wire [15:0] instructions2_data;
wire [15:0] correct_data;
wire [15:0] wrong_data;
wire [15:0] over_data;
reg sw8;

screen1 screens(sixclock,pixel_index, title_data, instructions_data,instructions2_data, correct_data, wrong_data, over_data);

clock_divider clkp5hz(CLK100MHZ , 6249999 , clkp5);


rng_gen word_gen(clkp5 ,random_word);
rng_gen color_gen(sixclock ,random_color);

blue_color blue(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,blue_data);
red_color red(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,red_data);
green_color green(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,green_data);
pink_color pink(sixclock,x,y,WHITE,GREEN,PINK,RED,COLOR,pink_data);

always @ (posedge sixclock) begin
//    sw8 <= sw[8];
    if (startflag == 1) begin
        if (lives == 0) begin
            endflag = 1;
        end
        word <= (counter==0)? random_word%4 : word; //picks a random word
        background_color <= (counter==0)? random_color%4 : background_color; //picks a random background color
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
    // up - GREEN
    // down - RED
    // left - BLUE
    // right - PINK
    case (word)
        BLUE_WORD:
        begin
            wordgamedata <= blue_data;
            if (up==0 && down==0 && left==1 && right==0) begin
                correctflag = CORRECT; //correct answer
            end
            if (up == 1 || down== 1 || right == 1) begin
                if (button_counter == 0) begin
                word <= WRONG_SCREEN;
                case(lives)
                7: lives <= 3;
                3: lives <= 1;
                1: lives <= 0;                
                endcase
                ver_speed <= 1;
                counter <= ver_speed;
                correctflag = NOINPUT;
                end
            end
        end
        RED_WORD:
        begin
            wordgamedata <= red_data;
            if (up==0 && down==1 && left==0 && right==0) begin
                correctflag = CORRECT; //correct answer
            end
            if (up == 1 || left== 1 || right == 1) begin
                if (button_counter == 0) begin
                word <= WRONG_SCREEN;
                case(lives)
                7: lives <= 3;
                3: lives <= 1;
                1: lives <= 0;                
                endcase
                ver_speed <= 1;
                counter <= ver_speed;
                correctflag = NOINPUT;
                end
            end
        end
        GREEN_WORD:
        begin
            wordgamedata <= green_data;
            if (up==1 && down==0 && left==0 && right==0) begin
                correctflag = CORRECT; //correct answer
            end
            if (left == 1 || down== 1 || right == 1) begin
                if (button_counter == 0) begin
                word <= WRONG_SCREEN;
                case(lives)
                7: lives <= 3;
                3: lives <= 1;
                1: lives <= 0;                
                endcase
                ver_speed <= 1;
                counter <= ver_speed;
                correctflag = NOINPUT;
                end
            end
        end
        PINK_WORD:
        begin
            wordgamedata <= pink_data;
            if (up==0 && down==0 && left==0 && right==1) begin
                correctflag = CORRECT; //correct answer
            end
            if (up == 1 || down== 1 || left == 1) begin
                if (button_counter == 0) begin
                word <= WRONG_SCREEN;
                case(lives)
                7: lives <= 3;
                3: lives <= 1;
                1: lives <= 0;                
                endcase
                ver_speed <= 1;
                counter <= ver_speed;
                correctflag = NOINPUT;
                end
            end
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
    end
    
    if (word_start == 1) begin
        if (startflag == 0) begin
            fivesec = fivesec + 1;
            case (startscreens)
                0: wordgamedata <= title_data;
                1: wordgamedata <= instructions_data;
                2: wordgamedata <= instructions2_data;
            endcase
            startscreens <= (fivesec == 0)?((startscreens == 2)?startscreens:startscreens+1):startscreens;
            lives <= 7;
            if (reset && startscreens == 2) begin
                startflag <= 1;
                startscreens <= 0;
            end
        end
    end
    if (word_start == 0) begin
        fivesec = 0;
        startscreens <= 0;
        startflag <= 0;
    end
    
    // Checks if answer is correct
    if(correctflag == CORRECT && counter != 0 && word!= CORRECT_SCREEN) begin //answer is correct with time remaining
        score <= score + 1;
        word <= CORRECT_SCREEN;
        ver_speed <= 1;
        counter <= ver_speed;
        correctflag = NOINPUT;
    end

    if (endflag) begin
        if (reset) begin //restart game
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
            lives <= 7;
            startscreens <= 0;
            startflag <= 0;
        end
        else begin
            word <= END_SCREEN;
            correctflag = NOINPUT;
        end
    end
end

endmodule
