`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2020 23:44:01
// Design Name: 
// Module Name: covid_screens
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


module covid_screens(input sixclock,input [12:0]pixel_index, output reg [15:0] covid_title_data, output reg [15:0] safe_data, output reg [15:0] wash_data, output reg [15:0] sanitiser_data, output reg [15:0] mask_data, output reg [15:0] distancing_data);

reg [15:0] covid_title [0:6143];
reg [15:0] safe [0:6143];
reg [15:0] wash [0:6143];
reg [15:0] sanitiser [0:6143];
reg [15:0] mask [0:6143];
reg [15:0] distancing [0:6143];
//reg [15:0] stayhome [0:6143];

reg [15:0] test [0:6143];

always @ (posedge sixclock) begin

$readmemh("covid_title.mem", covid_title);
$readmemh("keeping_safe.mem", safe);
$readmemh("wash_hands.mem", wash);
$readmemh("sanitiser.mem", sanitiser);
$readmemh("mask.mem", mask);
$readmemh("distancing.mem", distancing);
$readmemh("stayhome.mem", stayhome);

covid_title_data = covid_title[pixel_index];
safe_data = safe[pixel_index];
wash_data = wash[pixel_index];
sanitiser_data = sanitiser[pixel_index];
mask_data = mask[pixel_index];
distancing_data = distancing[pixel_index];
//stayhome_data = stayhome[pixel_index];
end
endmodule
