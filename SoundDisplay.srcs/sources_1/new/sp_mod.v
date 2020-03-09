`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 15:37:13
// Design Name: 
// Module Name: sp_mod
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


module sp_mod(input pb, input CLOCK, output reg slow, output sp_out);
    wire A,B;
    reg [21:0]count = 0;
    always @ (posedge CLOCK)
    begin
        count <= count + 1;
        slow <= (count==0)? ~slow : slow;
    end
    my_dff dff1(slow, pb, A);
    my_dff dff2(slow,A, B);
    assign sp_out = A & ~B;
endmodule
