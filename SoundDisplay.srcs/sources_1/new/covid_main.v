`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2020 23:43:30
// Design Name: 
// Module Name: covid_main
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


module covid_main(input sixclock,input covid_start, input [15:0] soundlevel, input [12:0]pixel_index,output reg [15:0] covid_data);
wire [15:0] covid_title_data;
wire [15:0] safe_data;
wire [15:0] wash_data;
wire [15:0] sanitiser_data;
wire [15:0] mask_data;
wire [15:0] distancing_data;
//wire [15:0] stayhome_data;

reg [2:0]mode = 0;
reg [22:0] onesec = 0;
reg [24:0] fivesec = 0;
reg flag;

covid_screens screen(sixclock,pixel_index, covid_title_data, safe_data, wash_data, sanitiser_data, mask_data, distancing_data);

always @ (posedge sixclock) begin
    if (covid_start == 1) begin
        fivesec <= fivesec + 1; //to be deleted
        onesec <= onesec + 1;
    
        case (mode)
        0: covid_data <= covid_title_data;
        1: covid_data <= safe_data;
        2: covid_data <= wash_data;
        3: covid_data <= sanitiser_data;
        4: covid_data <= mask_data;
        5: covid_data <= distancing_data;
    //    6: covid_data <= stayhome_data;
        endcase
    
        if (onesec == 0) begin
            flag <= 1;
        end

        //to implement with sound
    //    if (soundlevel == 16'b1111111111111111 && flag == 1) begin
    //        mode <= (mode == 5)? 0 : mode + 1;
    //        flag <= 0;
    //    end

        //to be deleted
        if (flag == 1 && fivesec == 0) begin
            mode <= (mode == 5)? 0 : mode + 1;
            flag <= 0;
        end
    end
    
    if (covid_start == 0) begin
        fivesec <= 0;
        onesec <= 0;
        mode <= 0;
        flag <= 0;
    end
end

endmodule
