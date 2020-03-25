`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 16:13:35
// Design Name: 
// Module Name: numberscrollA
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


module numberscrollA(input CLK ,input [11:0]max,  output reg[7:0]number = 0, input[15:0]countA );
reg [4:0]counter = 0;
always@ (posedge CLK)
    begin
    if (countA > 16)
        counter = 6;
    else
        counter = countA%10;
    case(counter)
        0:  
            number <= 8'b11000000; //0
        1:
            number <= 8'b11111001; //1
        2:
            number <= 8'b10100100; //2
        3:  
            number <= 8'b10110000;//3
        4:
            number <= 8'b10011001;//4
        5:
            number <= 8'b10010010;//5
        6:
            number <= 8'b10000010;//6
        7:
            number <= 8'b11111000;//7
        8:
            number <= 8'b10000000;//8
        9:
            number <= 8'b10010000;//9
        endcase       
    end

endmodule
