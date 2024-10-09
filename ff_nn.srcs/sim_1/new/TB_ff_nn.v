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
    reg [31:0] in;
    wire [15:0] out;
    
    ff_nn unit_test(in, out);
    
    initial 
    begin
        in = 32'h11223344;
        #2
        in = 32'h22222222;
        #2
        in = 32'h11223344;
        #2
        in = 32'h89ABCDEF;
    end
endmodule
