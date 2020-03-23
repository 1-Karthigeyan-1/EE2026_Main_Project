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
    input CLK100MHZ,
    input mid_button,
    output rgb_cs,rgb_sdin,rgb_sclk,rgb_d_cn,rgb_resn,rgb_vccen,rgb_pmoden,
    output reg [11:0]led
    );
    
    wire [15:0] oled_data;
    wire sixclock, reset, clk20k;
    wire [11:0] my_mic_data;
    wire [12:0] pixel_index;
    reg mode;
    reg [15:0] soundlevel;
    wire [16:0] barclock;
    reg [11:0] copy_of_mic = 0;
    
    clock_divider clk(CLK100MHZ , 2499 , clk20k);
    clock_divider clk6p25m(CLK100MHZ, 8 , sixclock);
    debounce deboun(mid_button,CLK100MHZ,reset);
    Oled_Display oled(.clk(sixclock), .reset(reset),.pixel_index(pixel_index),
    .pixel_data(oled_data), .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), .resn(rgb_resn), .vccen(rgb_vccen),
      .pmoden(rgb_pmoden));
    Audio_Capture CaptAudio(.CLK(CLK100MHZ),.cs(clk20k), .MISO(J_MIC3_Pin3), .clk_samp(J_MIC3_Pin1),.sclk(J_MIC3_Pin4),.sample(my_mic_data) );

    oled_main display(sixclock, sw , soundlevel, pixel_index, oled_data);
/*
    always @ (posedge sixclock) begin
        soundlevel <= 16'b1111111111111111;
    end
*/

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

endmodule
