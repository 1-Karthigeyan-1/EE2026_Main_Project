`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////

module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    // Delete this comment and include other inputs and outputs here
    input [15:0] sw,
    output reg [3:0]an = 0,
    output reg [7:0]seg = 0,
    input CLK100MHZ,
    input mid_button,
    output rgb_cs,rgb_sdin,rgb_sclk,rgb_d_cn,rgb_resn,rgb_vccen,rgb_pmoden,
    output reg [15:0]led
    );
    
    wire [15:0] oled_data;
    wire sixclock, reset, clk20k, clk2, clk381;
    wire [11:0] my_mic_data;
    wire [12:0] pixel_index;
    reg [15:0] soundlevel;
    wire [16:0] barclock;
    reg [11:0] copy_of_mic = 0;
    reg [11:0]max = 0;
    reg [2:0]display_state = 0;
    wire [15:0]led_state;
    wire [7:0]segs0 , segs1;
    reg [15:0] sound_state;
    
    clock_divider clk(CLK100MHZ , 2499 , clk20k);
    clock_divider clk6p25m(CLK100MHZ, 8 , sixclock);
    clock_divider clk2hz(CLK100MHZ , 12499999 ,clk2);
    clock_divider clk381hz(CLK100MHZ , 130 , clk381);
    
    debounce deboun(mid_button,CLK100MHZ,reset);
    
    Oled_Display oled(.clk(sixclock), .reset(reset),.pixel_index(pixel_index),
    .pixel_data(oled_data), .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), .resn(rgb_resn), .vccen(rgb_vccen),
      .pmoden(rgb_pmoden));
    Audio_Capture CaptAudio(.CLK(CLK100MHZ),.cs(clk20k), .MISO(J_MIC3_Pin3), .clk_samp(J_MIC3_Pin1),.sclk(J_MIC3_Pin4),.sample(my_mic_data) );
    amplitude_mode amp(.CLK100MHZ(CLK100MHZ), .clk2(clk2),  .my_mic_data(my_mic_data)  , .led_state(led_state), .segs0(segs0) , .segs1(segs1)  );
    
    oled_main display(sixclock, sw , soundlevel, pixel_index, oled_data);
/*
    always @ (posedge sixclock) begin
        soundlevel <= 16'b1111111111111111;
    end
*/

    always @ (posedge clk381)
    begin
//        led = (sw[0] == 1) ? my_mic_data:(led_state); //replace 0 with amplitude stud;
        
        if(sw[0] == 1)
            display_state  = 0;
        else
            display_state <= display_state + 1;
        case(display_state)
        0:
        begin
            an <= 4'b1111;
            seg <= 8'b1111_1111;
        end
        1:
        begin
            an <= 4'b1110;
            seg <= segs0;
        end
        2:
        begin
            an <= 4'b1101;
            seg <= segs1;
        end
        3:
        begin
             an <= 4'b1111;
             seg <= 8'b1111_1111;
             display_state <= 0;
        end
        endcase  
    end
    always @ (posedge clk2) begin
        led <= (sw[0] == 1) ? my_mic_data:(led_state); //replace 0 with amplitude stud;
        sound_state <= led_state;
    end
    always @ (posedge sixclock) begin
        soundlevel <= sound_state;
        if (sw[11] == 0)
            copy_of_mic <= sound_state;
        //Freeze volume bar
        if (sw[11] == 1)
            soundlevel <= copy_of_mic;
        //Hide volume bar
        if (sw[10] == 1) begin
            soundlevel <= 0;
        end
    end
/*
    always@(posedge sixclock)
    begin
        led = (sw[0] == 1) ? my_mic_data:0;
        soundlevel <= my_mic_data;
        if (sw[11] == 0)
            copy_of_mic <= my_mic_data;
        //Freeze volume bar
        if (sw[11] == 1)
            soundlevel <= copy_of_mic;
        //Hide volume bar
        if (sw[10] == 1) begin
            soundlevel <= 0;
        end
    end
*/
endmodule
