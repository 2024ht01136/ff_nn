`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BITS 
// Engineer: Satyanarayana H S [ BITS ID 2024ht01136 ]
// 
// Create Date: 09.10.2024 17:49:16
// Design Name: 
// Module Name: ff_nn
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

module ff_nn (
    input [31:0] inputs,  // 4 inputs (8 bits each)
    output reg [15:0] outputs   // 2 outputs (8 bits each)
);

// Define weights and biases for hidden layer
reg [7:0] weights_input [0:2][0:3];
reg [7:0] weights_output [0:1][0:2];

initial begin
    weights_input[0][0] = 1;
    weights_input[0][1] = 2;
    weights_input[0][2] = 3;
    weights_input[0][3] = 4;
    weights_input[1][0] = 5;
    weights_input[1][1] = 6;
    weights_input[1][2] = 7;
    weights_input[1][3] = 8;
    weights_input[2][0] = 8;
    weights_input[2][1] = 7;
    weights_input[2][2] = 6;
    weights_input[2][3] = 5;
    weights_input[3][0] = 4;
    weights_input[3][1] = 3;
    weights_input[3][2] = 2;
    weights_input[3][3] = 1;
    
    weights_output[0][0] = 1;
    weights_output[0][1] = 2;
    weights_output[0][2] = 3;
    weights_output[1][0] = 3;
    weights_output[1][1] = 2;
    weights_output[1][2] = 1;
end

reg [7:0] biases_input [2:0];
reg [7:0] biases_output [0:1];

initial begin
    biases_input[0] = 1;
    biases_input[1] = 1;
    biases_input[2] = 1;
    
    biases_output[0] = 1;
    biases_output[1] = 1;
    biases_output[2] = 1;
end

// ReLU function (activation function)
function signed [7:0] ReLU(input signed [7:0] x);
    begin
        ReLU = (x < 0) ? 8'd0 : x;
    end
endfunction

reg [7:0] hidden_layer [0:2];
integer i;
reg [7:0] hidden_product_plus_bias;
reg [7:0] output_product_plus_bias;
    
// Feedforward process
always @(*) begin
    // Compute hidden layer activations
    for (i = 0; i < 3; i = i + 1) begin
        hidden_product_plus_bias = biases_input[i] + 
            weights_input[i][0] * inputs[31:24] + 
            weights_input[i][1] * inputs[23:16] +
            weights_input[i][2] * inputs[15:8]  +
            weights_input[i][3] * inputs[7:0];
        hidden_layer[i] = ReLU(hidden_product_plus_bias);
    end

    // Compute output layer activations
    for (i = 0; i < 2; i = i + 1) begin
        output_product_plus_bias = biases_output[i] + 
            weights_output[i][0] * hidden_layer[0] +
            weights_output[i][1] * hidden_layer[1] +
            weights_output[i][2] * hidden_layer[2];
            
        outputs[8*i +: 8] = output_product_plus_bias; // Store 8 bits of the output
    end
end

endmodule
