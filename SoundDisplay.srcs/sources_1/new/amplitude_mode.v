`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2020 22:48:19
// Design Name: 
// Module Name: anplitude_mode
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


module amplitude_mode(input CLK100MHZ,input clk2,  input[11:0] my_mic_data  , output reg [15:0]led_state = 0, output reg[7:0]segs1 = 0, output reg[7:0]segs0 = 0);
    reg [11:0]max = 0;
    always@(posedge CLK100MHZ, posedge clk2)
    begin
        if(clk2 == 1)
        begin
            max = 0;
        end
        
        else if (max < my_mic_data)
        begin
            max <= my_mic_data;
        end 
       
    end
    
    always@(posedge clk2)
    begin           
        if (max >= 3500)
        begin
            led_state <= 16'b1111_1111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <= 8'b10010010; //5
        end
        else if (max >= 3375)
        begin
            led_state <= 16'b0111_1111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <= 8'b10011001; //4
        end
        else if (max >= 3250)
        begin
            led_state <= 16'b0011_1111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <= 8'b10110000; //3
        end
        else if (max >= 3125)
        begin
            led_state <= 16'b0001_1111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <= 8'b10100100; //2         
        end
        else if (max >= 3000)
        begin
            led_state <= 16'b0000_1111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <=  8'b11111001; //1
        end
        else if (max >= 2875)
        begin
            led_state <= 16'b0000_0111_1111_1111;
            segs1 <= 8'b11111001; //1
            segs0 <= 8'b11000000; //0
        end
        else if (max >= 2750)
        begin
            led_state <= 16'b0000_0011_1111_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10010000; //9
        end
        else if (max >= 2625)
        begin
            led_state <= 16'b0000_0001_1111_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10000000; //8
        end
        else if (max >= 2500)
        begin
            led_state <= 16'b0000_0000_1111_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b11111000; //7
        end
        else if (max >= 2375)
        begin
            led_state <= 16'b0000_0000_0111_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10000010; //6
        end               
        else if (max >= 2250)
        begin
            led_state <= 16'b0000_0000_0011_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10010010; //5
        end        
        else if (max >= 2125)
        begin
            led_state <= 16'b0000_0000_0001_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10011001; //4
        end
        else if (max >= 2000)
        begin
            led_state <= 16'b0000_0000_0000_1111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10110000; //3
       end       
        else if (max >= 1875)
        begin
            led_state <= 16'b0000_0000_0000_0111;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b10100100; //2
        end        
        else if (max >= 1750)
        begin
            led_state <= 16'b0000_0000_0000_0011;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b11111001; //1
        end
        else
        begin
            led_state <= 16'b0000_0000_0000_0001;
            segs1 <= 8'b11000000; //0
            segs0 <= 8'b11000000; //0
        end       
    end
endmodule
