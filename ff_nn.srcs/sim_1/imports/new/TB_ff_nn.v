`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BITS
// Engineer: Satyanarayana H S [ BITS ID 2024ht01136 ]
// 
// Create Date: 09.10.2024 21:16:25
// Design Name: 
// Module Name: TB_ff_nn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Hardware Software Co-Design, Assignement 1
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_ff_nn(
    );
    reg [7:0] in1, in2, in3, in4;
    wire [7:0] out1, out2;
    
    ff_nn unit_test(in1, in2, in3, in4, out1, out2);
    
    initial 
    begin
        in1 = 8'h11; in2 = 8'h22; in3 = 8'h33; in4 = 8'h44;
        #2
        in1 = 8'h22; in2 = 8'h22; in3 = 8'h22; in4 = 8'h22;
        #2
        in1 = 8'h11; in2 = 8'h22; in3 = 8'h33; in4 = 8'h44;
        #2
        in1 = 8'h89; in2 = 8'hAB; in3 = 8'hCD; in4 = 8'hEF;
    end
endmodule
