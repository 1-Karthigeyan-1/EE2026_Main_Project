`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 00:08:53
// Design Name: 
// Module Name: wordStart
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


module wordStart(input sizclock,input startFlag, output oled_data,output finishFlag);
    always @ (posedge sixclock)
    if (startFlag) begin
        if (x >= 2 && x <= 92 && y >= 19 && y <= 23) begin
             
        end
    end
endmodule
