`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 14:08:45
// Design Name: 
// Module Name: balloon_screens
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


module balloon_screens(input sixclock,input [12:0]pixel_index, output reg [15:0] balloon1_data, output reg [15:0] balloon2_data, output reg [15:0] balloon3_data, output reg [15:0] balloon4_data, output reg [15:0] balloon5_data, output reg [15:0] balloon6_data);

reg [15:0] balloon1 [0:6143];
reg [15:0] balloon2 [0:6143];
reg [15:0] balloon3 [0:6143];
reg [15:0] balloon4 [0:6143];
reg [15:0] balloon5 [0:6143];
reg [15:0] balloon6 [0:6143];

always @ (posedge sixclock) begin

$readmemh("balloon1.mem", balloon1);
//$readmemh("balloon2.mem", balloon2);
//$readmemh("balloon3.mem", balloon3);
//$readmemh("balloon4.mem", balloon4);
//$readmemh("balloon5.mem", balloon5);
//$readmemh("balloon6.mem", balloon6);

balloon1_data = balloon1[pixel_index];
//balloon2_data = balloon2[pixel_index];
//balloon3_data = balloon3[pixel_index];
//balloon4_data = balloon4[pixel_index];
//balloon5_data = balloon5[pixel_index];
//balloon6_data = balloon6[pixel_index];

end
endmodule
