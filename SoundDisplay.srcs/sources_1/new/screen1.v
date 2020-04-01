`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2020 21:05:21
// Design Name: 
// Module Name: screen1
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


module screen1(input sixclock,input [12:0]pixel_index, output reg [15:0] correct_data, output reg [15:0] wrong_data, output reg [15:0] over_data);

reg [15:0] correct_screen [0:6143];
reg [15:0] wrong_screen [0:6143];
reg [15:0] game_over [0:6143];

always @ (posedge sixclock) begin

$readmemh("correct_screen.mem", correct_screen);
$readmemh("wrong_screen.mem", wrong_screen);
$readmemh("game_over.mem", game_over);
correct_data = correct_screen[pixel_index];
over_data = game_over[pixel_index];
wrong_data = wrong_screen[pixel_index];

end
endmodule
