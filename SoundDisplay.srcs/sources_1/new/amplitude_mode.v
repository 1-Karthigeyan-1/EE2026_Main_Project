`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2020 22:48:19
// Design Name: 
// Module Name: amplitude_mode
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


module amplitude_mode(input clk20k,clk2,clk381  , input[11:0] my_mic_data  , output reg [15:0]led_state = 0, output [7:0]segs0,segs1,segs2,segs3 ,  output reg [4:0]countA = 0 );
    reg [11:0]max = 0;
    reg [15:0]counter = 0;
    parameter [8:0] x = 115;
    parameter [12:0] y = 2250;
    
   number2seg convert(.clk(clk2) , .segs0(segs0) , .segs1(segs1) ,.segs2(segs2) , .segs3(segs3),  .countA(countA) , .max(16) );
    /*
    always@(posedge clk20k, posedge clk2)
    begin
        if(clk2)
        begin
        
            if (max >= 3500)
                countA = 16;
            else if (max >= 3375)
                countA = 15;
            else if (max >= 3250)
                countA = 14;
            else if (max >= 3125)
                countA = 13;
            else if (max >= 3000)
                countA = 12;
            else if (max >= 2875)
                countA = 11;
            else if (max >=2750)
                countA = 10;
            else if (max >= 2625)
                countA = 9;
            else if (max >= 2500)
                countA = 8;
            else if (max >= 2375)
                countA = 7;
           else if (max >= 2250)
                countA = 6;
           else if (max >= 2125)
                countA = 5;
           else if (max >= 2000)
                countA = 4;
           else if (max >= 1875)
                countA = 3;
           else if (max >= 1750)
                countA = 2;
           else if (max >= 1625)
                countA = 1;
           else if (max > 0)
                countA = 0;
           max <= 0;
       
            
            case(countA)
            0:
                led_state <= 16'b0000_0000_0000_0000;
            1:
                led_state <= 16'b0000_0000_0000_0001;
            2:
                led_state <= 16'b0000_0000_0000_0011;
            3:
               led_state <= 16'b0000_0000_0000_0111;
            4:
                led_state <= 16'b0000_0000_0000_1111;
            5:
                led_state <= 16'b0000_0000_0001_1111;
            6:
                led_state <= 16'b0000_0000_0011_1111;
            7:
                led_state <= 16'b0000_0000_0111_1111;
            8:
                led_state <= 16'b0000_0000_1111_1111;
            9:
                led_state <= 16'b0000_0001_1111_1111;
            10:
                led_state <= 16'b0000_0011_1111_1111;
            11:
                led_state <= 16'b0000_0111_1111_1111;
            12:
                led_state <= 16'b0000_1111_1111_1111;
            13:
                led_state <= 16'b0001_1111_1111_1111;
            14:
                led_state <= 16'b0011_1111_1111_1111;
            15:
                led_state <= 16'b0111_1111_1111_1111;
            16:
                led_state <= 16'b1111_1111_1111_1111;
           endcase
         end
       if((clk20k) && (max < my_mic_data))
            max <= my_mic_data;
                //max = my_mic_data;
    end
    */
    
    always @ (posedge clk20k) begin
        counter <= counter + 1;
        if(max < my_mic_data)
            max <= my_mic_data;
        if (counter == 10000)
        begin
            max <= 0;
            counter <= 0;
        end
        
    end
    always @ (posedge clk2) begin
    
        if (max >= ( y + 15 * x))
            countA <= 16;
        else if (max >= ( y + 14 * x))
            countA <= 15;
        else if (max >= ( y + 13 * x))
            countA <= 14;
        else if (max >= ( y + 12 * x))
            countA <= 13;
        else if (max >= ( y + 11 * x))
            countA <= 12;
        else if (max >= ( y + 10 * x))
            countA <= 11;
        else if (max >= ( y + 9 * x))
            countA <= 10;
        else if (max >= ( y + 8 * x))
            countA <= 9;
        else if (max >= ( y + 7 * x))
            countA <= 8;
        else if (max >= ( y + 6 * x))
            countA <= 7;
       else if (max >= ( y + 5 * x))
            countA <= 6;
       else if (max >= ( y + 4 * x))
            countA <= 5;
       else if (max >= ( y + 3 * x))
            countA <= 4;
       else if (max >= ( y + 2 * x))
            countA <= 3;
       else if (max >= (y + x))
            countA <= 2;
       else if (max >=  y)
            countA <= 1;
       else 
            countA <= 0;
       end
       
       always @ (posedge clk2)
       begin 
        case(countA)
        0:
            led_state <= 16'b0000_0000_0000_0000;
        1:
            led_state <= 16'b0000_0000_0000_0001;
        2:
            led_state <= 16'b0000_0000_0000_0011;
        3:
           led_state <= 16'b0000_0000_0000_0111;
        4:
            led_state <= 16'b0000_0000_0000_1111;
        5:
            led_state <= 16'b0000_0000_0001_1111;
        6:
            led_state <= 16'b0000_0000_0011_1111;
        7:
            led_state <= 16'b0000_0000_0111_1111;
        8:
            led_state <= 16'b0000_0000_1111_1111;
        9:
            led_state <= 16'b0000_0001_1111_1111;
        10:
            led_state <= 16'b0000_0011_1111_1111;
        11:
            led_state <= 16'b0000_0111_1111_1111;
        12:
            led_state <= 16'b0000_1111_1111_1111;
        13:
            led_state <= 16'b0001_1111_1111_1111;
        14:
            led_state <= 16'b0011_1111_1111_1111;
        15:
            led_state <= 16'b0111_1111_1111_1111;
        16:
            led_state <= 16'b1111_1111_1111_1111;
        endcase
    end
          
endmodule
