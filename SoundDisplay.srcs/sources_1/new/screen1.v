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


module screen1(input sixclock,input [12:0]pixel_index, output reg [15:0] pixel_data);

reg [15:0] my_memory [0:6143];
reg [12:0] i;
always @ (posedge sixclock) begin

$readmemh("megumin.mem", my_memory);
pixel_data = my_memory[pixel_index];

end
endmodule
