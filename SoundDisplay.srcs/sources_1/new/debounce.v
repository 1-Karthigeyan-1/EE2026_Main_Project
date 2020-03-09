`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 15:36:32
// Design Name: 
// Module Name: debounce
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


module debounce(input pb, input CLOCK, output reg out = 0);
    wire slow, sp_out;
    reg [7:0]my_counter = 0;
    sp_mod test(pb, CLOCK,slow,sp_out);
    always @ (posedge slow) begin
        out <= (sp_out==1)?1:0;
    end
endmodule
