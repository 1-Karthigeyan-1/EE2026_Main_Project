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


module balloon_screen_main(input clock , input sw8, input [4:0]balloon_state , input [12:0]pixel_index, output reg [12:0] balloon_data );

wire [12:0] balloon1_data , balloon2_data , balloon3_data , balloon4_data , balloon5_data , balloon6_data;

screen1 bscreens(clock, sw8 ,pixel_index, balloon1_data, balloon2_data,balloon3_data, balloon4_data, balloon5_data, balloon6_data);

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
