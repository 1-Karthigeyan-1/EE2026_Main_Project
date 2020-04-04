`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 14:30:05
// Design Name: 
// Module Name: balloon_game
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


module balloon_game( input left_button,  input[4:0]peak_count,  input sw , input right_button  , input slow_clock  ,fast_clock,   countdown_clock , output [15:0]timer , output [7:0] segs0 , segs1, segs2, segs3, output reg [4:0]balloon_state); 
reg enable1 , enable2;
parameter startgame = 0;
reg [20:0] number , max;

wire [7:0] random1 , random2;
wire timer_clear  , timer_done  , section_clear ;
wire [4:0]peak_number; //the decimal number of the peakq
wire [3:0] upperlimitA;
wire [4:0] lower_limit , upper_limit; //RN 6-9 for upper 0 - 2 for lower
reg [15:0]points = 0;
wire clear;
wire lose_condition;
assign lose_condition = ((balloon_state == 16) || (timer_done == 1)) ? 1 : 0;
assign clear = left_button;
assign timer_clear = right_button || ~sw || left_button;
led_trail countdown( .clear(timer_clear) , .clock(countdown_clock) ,.done(timer_done), .led_state(timer));
rng_gen lower_limit_random(.clkp5(timer_clear) , .actual(random1)); //start random gen whenever there is a new session
assign lower_limit = random1 % 4;
rng_gen upper_limit_random(.clkp5(timer_clear) , .actual(random2));
assign upperlimitA = (random2)%4;
assign upper_limit = upperlimitA[3:0] + 6;



//check the balloon state through 7 seg display
assign segs3 = lose_condition? 8'b11000111 : 8'b1111_1111; //L
assign segs2 = lose_condition? 8'b11000000 : 8'b1111_1111; //O
assign segs1 = lose_condition? 8'b10010010 : 8'b1111_1111; //S
assign segs0 = lose_condition? 8'b10000110 : 8'b1111_1111; //E
always@(posedge slow_clock, posedge right_button , posedge clear)
begin
    if (clear)
    begin
        points = 0;
        balloon_state = lower_limit;
    end
    
    else if (right_button)
    begin
        begin     
            points <= points + balloon_state;
            balloon_state <= lower_limit;
        end
    end
    else
    begin
        if ((sw & ~clear) == 1)
        begin
            if (peak_count > 10)
            begin
                if (balloon_state > upper_limit)
                    balloon_state <= 16; //16 is popped
                else 
                balloon_state <= balloon_state + 1;
            end
        end
    end 
 end
  



endmodule