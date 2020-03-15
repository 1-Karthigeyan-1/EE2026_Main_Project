`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 14:45:37
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(input basys_clock,input [12:0]m, output reg cd_out = 0);
    reg [20:0] count = 0;
    always @ (posedge basys_clock) begin
        count <= (count == m)? 0: count + 1;
        cd_out <= (count == 0) ? ~cd_out : cd_out;
    end
endmodule
