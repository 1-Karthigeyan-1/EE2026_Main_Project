`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 01:56:11
// Design Name: 
// Module Name: drawBalloon
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


module drawBalloon(input sixclock, input [3:0] mode, input [6:0] x, input [6:0] y, input [15:0] YELLOW,input [15:0] BLACK,output reg [15:0] oled_data);

    always @ (posedge sixclock) begin
    case (mode)
        0:
        begin
            if(x == 45 && y == 60) begin //1
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 57) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 56) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 55) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        1:
        begin
            if(x == 45 && y == 60) begin //1
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 57) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 56) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 55) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 54) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 53) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 52) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 51) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        2:
        begin
            if(x == 45 && y == 60) begin //1
            oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 57) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 56) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 55) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 54) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 53) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 52) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 51) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 50) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 49) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 48) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 47) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        3:
        begin
            if(x == 45 && y == 60) begin //1
            oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 57) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 56) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 55) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 54) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 53) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 52) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 51) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 50) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 49) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 48) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 47) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 46) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 45) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 44) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 43) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        4:
        begin
            if(x == 45 && y == 60) begin //1
            oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 57) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 56) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 55) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 54) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 53) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 52) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 36 && x <=54  && y == 51) begin //19
                oled_data <= YELLOW;
            end
            else if(x >= 35 && x <=55  && y == 50) begin //21
                oled_data <= YELLOW;
            end
            else if(x >= 34 && x <=56  && y == 49) begin //23
                oled_data <= YELLOW;
            end
            else if(x >= 33 && x <=57  && y == 48) begin //25
                oled_data <= YELLOW;
            end
            else if(x >= 32 && x <=58  && y == 47) begin //27
                oled_data <= YELLOW;
            end
            else if(x >= 32 && x <=58  && y == 46) begin //27
                oled_data <= YELLOW;
            end
            else if(x >= 33 && x <=57  && y == 45) begin //25
                oled_data <= YELLOW;
            end
            else if(x >= 34 && x <=56  && y == 44) begin //23
                oled_data <= YELLOW;
            end
            else if(x >= 35 && x <=55  && y == 43) begin //21
                oled_data <= YELLOW;
            end
            else if(x >= 36 && x <=54  && y == 42) begin //19
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 41) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 40) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 39) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 38) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 37) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 36) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 35) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 34) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 33) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
        5:
        begin
            if(x == 45 && y == 60) begin //1
            oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 59) begin //3
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 58) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 57) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 56) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 55) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 54) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 53) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 52) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 36 && x <=54  && y == 51) begin //19
                oled_data <= YELLOW;
            end
            else if(x >= 35 && x <=55  && y == 50) begin //21
                oled_data <= YELLOW;
            end
            else if(x >= 34 && x <=56  && y == 49) begin //23
                oled_data <= YELLOW;
            end
            else if(x >= 33 && x <=57  && y == 48) begin //25
                oled_data <= YELLOW;
            end
            else if(x >= 32 && x <=58  && y == 47) begin //27
                oled_data <= YELLOW;
            end
            else if(x >= 31 && x <=59  && y == 46) begin //29
                oled_data <= YELLOW;
            end
            else if(x >= 30 && x <=60  && y == 45) begin //31
                oled_data <= YELLOW;
            end
            else if(x >= 29 && x <=61  && y == 44) begin //33
                oled_data <= YELLOW;
            end
            else if(x >= 28 && x <=62  && y == 43) begin //35
                oled_data <= YELLOW;
            end
            else if(x >= 28 && x <=62  && y == 42) begin //35
                oled_data <= YELLOW;
            end
            else if(x >= 27 && x <=63  && y == 41) begin //37
                oled_data <= YELLOW;
            end
            else if(x >= 27 && x <=63  && y == 40) begin //37
                oled_data <= YELLOW;
            end
            else if(x >= 26 && x <=62  && y == 39) begin //39
                oled_data <= YELLOW;
            end
            else if(x >= 26 && x <=62  && y == 38) begin //39
                oled_data <= YELLOW;
            end
            else if(x >= 27 && x <=63  && y == 37) begin //37
                oled_data <= YELLOW;
            end
            else if(x >= 27 && x <=63  && y == 36) begin //37
                oled_data <= YELLOW;
            end
            else if(x >= 28 && x <=62  && y == 35) begin //35
                oled_data <= YELLOW;
            end
            else if(x >= 28 && x <=62  && y == 34) begin //35
                oled_data <= YELLOW;
            end
            else if(x >= 29 && x <=61  && y == 33) begin //33
                oled_data <= YELLOW;
            end
            else if(x >= 30 && x <=60  && y == 32) begin //31
                oled_data <= YELLOW;
            end
            else if(x >= 31 && x <=59  && y == 31) begin //29
                oled_data <= YELLOW;
            end
            else if(x >= 32 && x <=58  && y == 30) begin //27
                oled_data <= YELLOW;
            end
            else if(x >= 33 && x <=57  && y == 29) begin //25
                oled_data <= YELLOW;
            end
            else if(x >= 34 && x <=56  && y == 28) begin //23
                oled_data <= YELLOW;
            end
            else if(x >= 35 && x <=55  && y == 27) begin //21
                oled_data <= YELLOW;
            end
            else if(x >= 36 && x <=54  && y == 26) begin //19
                oled_data <= YELLOW;
            end
            else if(x >= 37 && x <=53  && y == 25) begin //17
                oled_data <= YELLOW;
            end
            else if(x >= 38 && x <=52  && y == 24) begin //15
                oled_data <= YELLOW;
            end
            else if(x >= 39 && x <=51  && y == 23) begin //13
                oled_data <= YELLOW;
            end
            else if(x >= 40 && x <=50  && y == 22) begin //11
                oled_data <= YELLOW;
            end
            else if(x >= 41 && x <=49  && y == 21) begin //9
                oled_data <= YELLOW;
            end
            else if(x >= 42 && x <=48  && y == 20) begin //7
                oled_data <= YELLOW;
            end
            else if(x >= 43 && x <=47  && y == 19) begin //5
                oled_data <= YELLOW;
            end
            else if(x >= 44 && x <=46  && y == 18) begin //3
                oled_data <= YELLOW;
            end
            else if(x == 45 && y == 17) begin //1
                oled_data <= YELLOW;
            end
            else begin
                oled_data <= BLACK;
            end
        end
    endcase
    end
endmodule
