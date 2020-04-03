`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2020 14:31:00
// Design Name: 
// Module Name: led_trail
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


module led_trail(input clear , clock ,output reg done = 0, output reg [15:0]led_state = 16'b1111_1111_1111_1111);
always @ (posedge clock ,posedge clear)
begin
    if (clear == 1)
        led_state <= 16'b1111_1111_1111_1111;
    else
        begin
        led_state <= led_state/2;
        if (led_state == 0)
            done = 1;
        else
            done = 0;
        end
    
end
endmodule
