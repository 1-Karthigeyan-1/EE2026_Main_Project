`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 16:13:35
// Design Name: 
// Module Name: numberscrollB
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


module numberscrollB(input CLK ,input [11:0]max,  output reg[7:0]number = 0, input[15:0]countB );
reg counter = 0;
always@ (posedge CLK)
    begin
    if ((countB/10) <= 0)
        counter = 0;
    else
        counter = 1;
    case(counter)
        0:  
            number <= 8'b11000000; //0
        1:
            number <= 8'b11111001; //1
        default:
            counter = 1;
        endcase       
    end

endmodule
