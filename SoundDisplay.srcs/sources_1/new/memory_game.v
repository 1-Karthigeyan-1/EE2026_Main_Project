`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 22:32:59
// Design Name: 
// Module Name: memory_game
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


module memory_game(input sixclock, input startflag, input [6:0] x, input [6:0] y, input [15:0] GREEN,input [15:0] YELLOW,input [15:0] RED,input [15:0] BLACK,input [15:0] WHITE, input [15:0] soundlevel, output reg [15:0] mem_data);
wire [4:0] random;
wire [15:0] draw_question;
wire [15:0] draw_answer;
reg [15:0] qn_level;
reg [4:0] state;
reg [21:0] onesec = 0;
reg [22:0] twosec = 0;
reg [23:0] threesec = 0;
reg [23:0] ver = 0;
reg correctflag;
reg [2:0] mode = 0;
reg [3:0] num_level = 1;
reg [3:0] qn_num_level = 0;
reg [3:0] curr_level;
reg [15:0] ans_key [15:0];
parameter qnmode = 0, ansmode = 1, delaymode = 2;
reg i = 0;

rng_gen(sixclock ,random);

drawRectangle qn(sixclock,qn_level, x, y,GREEN,YELLOW,RED,BLACK,WHITE, draw_question);
drawRectangle ans(sixclock,soundlevel, x, y,GREEN,YELLOW,RED,BLACK,WHITE, draw_answer);

always @ (posedge sixclock) begin
    if (startflag == 1) begin

        state = (threesec == 0)? random % 16 +1 : state; //chooses a random state from 1 - 16
        case(state)
        1: qn_level <= 16'b0000000000000001;
        2: qn_level <= 16'b0000000000000011;
        3: qn_level <= 16'b0000000000000111;
        4: qn_level <= 16'b0000000000001111;
        5: qn_level <= 16'b0000000000011111;
        6: qn_level <= 16'b0000000000111111;
        7: qn_level <= 16'b0000000001111111;
        8: qn_level <= 16'b0000000011111111;
        9: qn_level <= 16'b0000000111111111;
        10: qn_level <= 16'b0000001111111111;
        11: qn_level <= 16'b0000011111111111;
        12: qn_level <= 16'b0000111111111111;
        13: qn_level <= 16'b0001111111111111;
        14: qn_level <= 16'b0011111111111111;
        15: qn_level <= 16'b0111111111111111;
        16: qn_level <= 16'b1111111111111111;
        endcase
        //num_level is essentially score
        case (mode)
            qnmode:
            begin
                //question to be displayed has yet to finish
                if (qn_num_level != num_level) begin
                    threesec <= threesec + 1;
                    if (threesec == 0) begin
                        qn_num_level <= qn_num_level + 1;
                        i <= i+1;
                        ans_key[i] <= qn_level;
                    end
                end
//                if (qn_num_level == num_level) begin
//                    mode <= ansmode;
//                end
            end
            /*
            ansmode:
            begin
                mem_data <= draw_answer;
                if (i != num_level) begin
                    if (soundlevel == ans_key[i]) begin
                        ver = ver + 1;
                        correctflag <= 1;
                        i = (ver == 0)? i +1 : i;
                    end
                end
                else begin
                    num_level <= num_level + 1;
                    copy_num_level = num_level;
                end
            end
            */
            delaymode:
            begin
                if (twosec == 0) begin
                    mode <= qnmode;
                    threesec <= 0;
                end
                else begin
                    twosec <= twosec + 1;
                    mem_data <= BLACK;
                end
            end
        endcase
/*        
        // keep going into question mode
        if (copy_num_level != 0) begin
            copy_num_level = copy_num_level - 1;
            mode <= qnmode;
        end
        //ans mode
        else begin
            mode <= ansmode;
        end
*/
    if (threesec ==0 && mode == qnmode) begin
        mem_data <= draw_question;
        mode <= delaymode;
    end
    end
    if (startflag == 0) begin
        twosec<= 0;
        threesec <= 0;
        state = 0;
    end
end
endmodule
