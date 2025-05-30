`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Nasit Vurgun (Nas)
// 
// Create Date: 05/30/2025 02:15:36 PM
// Module Name: blink
// Project Name: Blink LEDs on FPGA
// Target Devices: Xilinx Arty A7 - 35T
// Description: Blink the four on-board LEDs
// 
//////////////////////////////////////////////////////////////////////////////////

module blink (
    input wire clk,          // 100 MHz clock typically for Arty A7
    output wire led0,
    output wire led1,
    output wire led2,
    output wire led3
);

    reg [27:0] counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    // Assign different bits of the counter to each LED
    assign led0 = counter[27]; // Slowest blink
    assign led1 = counter[26]; // Blink rate = 2^(N+1)/freq_clk
    assign led2 = counter[25]; // Blink rate = 2^(N+1)/10^8 (100 MHz clock)
    assign led3 = counter[24]; // Fastest blink

endmodule
