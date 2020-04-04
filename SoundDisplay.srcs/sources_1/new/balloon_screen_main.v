`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 23:21:23
// Design Name: 
// Module Name: balloon_screen_main
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


module balloon_screen_main(input clock , input [6:0] x, input [6:0] y, input [15:0] YELLOW,input [15:0] BLACK, input [4:0]balloon_state ,  output reg [12:0] balloon_data );

wire [12:0] balloon1_data , balloon2_data , balloon3_data , balloon4_data , balloon5_data , balloon6_data;

//screen1 bscreens(clock, sw8 ,pixel_index, balloon1_data, balloon2_data,balloon3_data, balloon4_data, balloon5_data, balloon6_data);
drawBalloon(clock, 0, x, y, YELLOW,BLACK,balloon1_data);
drawBalloon(clock, 1, x, y, YELLOW,BLACK,balloon2_data);
drawBalloon(clock, 2, x, y, YELLOW,BLACK,balloon3_data);
drawBalloon(clock, 3, x, y, YELLOW,BLACK,balloon4_data);
drawBalloon(clock, 4, x, y, YELLOW,BLACK,balloon5_data);
drawBalloon(clock, 5, x, y, YELLOW,BLACK,balloon6_data);

//balloon_screens bscreen(clock ,pixel_index,  balloon1_data,  balloon2_data, balloon3_data, balloon4_data, balloon5_data,balloon6_data);
always @(posedge clock)
begin
    if (balloon_state > 10)
        balloon_data <= balloon6_data;
    else if (balloon_state > 8)
        balloon_data <= balloon5_data;
    else if (balloon_state > 6)
        balloon_data <= balloon4_data;
    else if (balloon_state > 4)
        balloon_data <= balloon3_data;
    else if (balloon_state > 2)
        balloon_data <= balloon2_data;
    else
        balloon_data <= balloon1_data;        
end
endmodule
