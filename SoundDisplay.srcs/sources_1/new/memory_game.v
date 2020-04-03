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
wire [15:0] question;
wire [15:0] answer;
reg [15:0] qn_level;
reg [4:0] state;
reg [21:0] onesec = 0;
reg [22:0] twosec = 0;
reg [23:0] threesec = 0;
reg [23:0] ver = 0;
reg correctflag;
reg mode;
reg [3:0] num_level = 1;
reg [3:0] copy_num_level = 0;
reg [3:0] curr_level;
reg [15:0] ans_key [15:0];
parameter qnmode = 0, ansmode = 1;
reg i = 0;

rng_gen(sixclock ,random);

drawRectangle qn(sixclock,qn_level, x, y,GREEN,YELLOW,RED,BLACK,WHITE, question);
drawRectangle ans(sixclock,soundlevel, x, y,GREEN,YELLOW,RED,BLACK,WHITE, answer);

always @ (posedge sixclock) begin
    if (startflag == 1) begin
        
        twosec <= twosec + 1;
        threesec <= threesec + 1;
        state <= random % 17; //chooses a random state
        
        case (mode)
            qnmode:
            begin
                if (copy_num_level != 0) begin
                    copy_num_level <= (threesec == 0)? copy_num_level - 1 : copy_num_level;
                    mem_data <= (twosec == 0)? question : BLACK;
                    qn_level = (threesec == 0)? state : qn_level; //choose a new question
                    i = (threesec == 0)? ((i == 15)?i:i+1):i;
                    ans_key[i] <= qn_level;
                end

            end
            ansmode:
            begin
                mem_data <= answer;
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
        endcase
        
        // keep going into question mode
        if (copy_num_level != 0) begin
            copy_num_level = copy_num_level - 1;
            mode <= qnmode;
        end
        //ans mode
        else begin
            mode <= ansmode;
        end
    end
end
endmodule
