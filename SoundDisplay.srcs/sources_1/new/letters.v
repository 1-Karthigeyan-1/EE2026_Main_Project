`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 00:14:39
// Design Name: 
// Module Name: letters
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


module letters(input sixclock, input [6:0] x, input [6:0] y, input[6:0] x1,input [6:0] x2, input [6:0] y1, input [6:0] y2, input [4:0] letter, input [15:0] WHITE,GREEN,PINK,RED,BLACK, output reg [15:0] oled_data);
always @ (posedge sixclock) begin
    case (letter)
        2: //b
        begin
            if((x == x1 && (y >= y1 && y <= y2)) || ((x> x1 && x < x2) && (y == (y1 + y2)/2 || y == y2)) || (x == x2 && (y > (y1 + y2)/2 && y < y2)))
                oled_data <= WHITE;
            else
                oled_data <= BLACK;
        end
        3: //C
        begin
            if((x == x1 && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y1 || y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        4: //d
        begin
            if((x == x2 && (y >= y1 || y <= y2)) || ((x>= x1 && x <= x2) && (y == (y1 + y2)/2 || y == y2)) || (x == x1 && (y <= y2 && y >= (y1 + y2)/2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        5: //E
        begin
            if((x == x1 && (y >= y1 || y <= y2)) || ((x>= x1 && x <= x2) && (y == y1 || y == (y1 + y2)/2 || y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        7: //G
        begin
            if(((x == x1) && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y1 || y == y2)) || (x==x2 && (y>=(y1+y2)/2 && y<=y2)) || (y == (y1+y2)/2 && (x>= (x1+x2)/2 && x <= x2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        8: //H
        begin
            if(((x == x1 || x == x2) && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == (y1+y2) / 2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        9: //I
        begin
            if(((x == (x1+x2)/2 ) && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y1 || y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        11: //K - 10x10
        begin
            if((x == x1 && (y >= y1 && y <= y2)) || (x == x1 +1 && (y == (y1+y2) /2))|| (x == x1 +2 && (y == (y1+y2) /2)) || (x == x1 + 3 && (y==((y1+y2)/2)+1 || y==((y1+y2)/2)-1)) || (x == x1 + 4 && (y==((y1+y2)/2)+2 || y==((y1+y2)/2)-2)) || (x == x1 + 5 && (y==((y1+y2)/2)+3 || y==((y1+y2)/2)-3)) || (x == x1 + 6 && (y==((y1+y2)/2)+4 || y==((y1+y2)/2)-4)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        12: //L
        begin
            if(((x == x1) && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        14: //N - 10x10
        begin
            if(((x == x1 || x ==x2) && (y >= y1 && y <= y2)) || (x == x1 + 1 && y==y1+1) || (x == x1 + 2 && y==y1+2) || (x == x1 + 3 && y==y1+3) || (x == x1 + 4 && y==y1+4) || (x == x1 + 5 && y==y1+5) || (x == x1 + 6 && y==y1+6) || (x == x1 + 7 && y==y1+7) || (x == x1 + 8 && y==y1+8) || (x == x1 + 9 && y==y1+9))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        15: //O
        begin
            if((x == x1 || x==x2) && (y >= y1 || y <= y2) || ((x>= x1 && x <= x2) && (y == y1 || y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        16: //P
        begin
            if((x == x1 && (y >= y1 || y <= y2)) || ((x>= x1 && x <= x2) && (y == y1 || y == (y1 + y2) /2)) || (x==x2 && (y>=y1 && y <= (y1+y2)/2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        18: //R
        begin
            if((x == x1 && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == (y1 + y2) /2)) || (x==x2 && (y >= (y1 + y2) /2 && y <= y2)) || (x>= x1 && x <= x2 - 1 && (y >= y1 && y <= (y1+y2)/2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        19: //S
        begin
            if((x == x1 && (y >= y1 && y <= (y1+y2)/2)) || ((x>= x1 && x <= x2) && (y == y1 || y == (y1 + y2) /2 || y == y2)) || (x==x2 && (y>=(y1+y2)/2 && y <= y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        20: //T
        begin
            if((x == x1 + 2 && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y1)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        21: //U
        begin
            if((x==x1 || x==x2) && (y >= y1 && y <= y2) || ((x>= x1 && x <= x2) && (y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        23: //W
        begin
            if(((x == x1 || x==(x1+x2)/2 || x == x2) && (y >= y1 && y <= y2)) || ((x>= x1 && x <= x2) && (y == y2)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
        25: //Y
        begin
            if((x == x1 + 2 && (y >= y1 + 2 && y <= y2)) || ((x== x1) && (y == y1)) || ((x== x1+1) && (y == y1+1)) || ((x== x2-1) && (y == y1-1))|| ((x== x2) && (y == y1)))
            oled_data <= WHITE;
            else
            oled_data <= BLACK;
        end
    endcase
end
endmodule
