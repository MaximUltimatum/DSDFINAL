`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Kaitlyn Franz
// 
// Create Date: 01/23/2016 03:44:35 PM
// Design Name: Claw
// Module Name: pmod_step_interface
// Project Name: Claw_game
// Target Devices: Basys3
// Tool Versions: 2015.4
// Description: This module is the top module for a stepper motor controller
// using the PmodSTEP. It operates in Full Step mode and encludes an enable signal
// as well as direction control. The Enable signal is connected to switch one and 
// the direction signal is connected to switch zero. 
// 
// Dependencies: 
// 
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pmod_step_interface(
    input clk, //input clock
    input rst, //reset input
    input [3:0] rf_input, //input from button clicker
    input [1:0] limit_switches,
    output [3:0] signal_out, //output to motor
    output [3:0] second_signal //output to motor2
    );
    
    //Temporary variables.
    wire new_clk_net;
    wire [3:0] rf_bounced;
    wire [1:0] limit_bounced;
    reg [3:0] rf_toggled;
    reg [1:0] limit_toggled;
    
    // Clock Divider to take the on-board clock
    // to the desired frequency.
    clock_div clock_Div(
        .clk(clk),
        .rst(rst),
        .new_clk(new_clk_net)
        );
        
    //Debounce Modules
    debounceplz debounce_button0(
        .clk(clk),
        .reset(rst),
        .sw(rf_input[0]),
        .db(rf_bounced[0])
        );
        
    debounceplz debounce_button1(
        .clk(clk),
        .reset(rst),
        .sw(rf_input[1]),
        .db(rf_bounced[1])
        );
        
    debounceplz debounce_button2(
            .clk(clk),
            .reset(rst),
            .sw(rf_input[2]),
            .db(rf_bounced[2])
            );
            
    debounceplz debounce_button3(
            .clk(clk),
            .reset(rst),
            .sw(rf_input[3]),
            .db(rf_bounced[3])
            );
            
    debounceplz debounce_limit0(
            .clk(clk),
            .reset(rst),
            .sw(limit_switches[0]),
            .db(limit_bounced[0])
            );
            
    debounceplz debounce_limit1(
            .clk(clk),
            .reset(rst),
            .sw(limit_switches[1]),
            .db(limit_bounced[1])
            );
    
    
    //Toggle-Lock Module
    always @ (posedge rf_bounced[0])
        begin
        if(rf_toggled[0] == 1'b1)
            rf_toggled[0] <= 1'b0;
        else
            rf_toggled[0] <= 1'b1;
        end
        
    always @ (posedge rf_bounced[1])
        begin
        if(rf_toggled[1] == 1'b1)
            rf_toggled[1] <= 1'b0;
        else
            rf_toggled[1] <= 1'b1;
        end
        
    always @ (posedge rf_bounced[2])
        begin
        if(rf_toggled[2] == 1'b1)
            rf_toggled[2] <= 1'b0;
        else
            rf_toggled[2] <= 1'b1;
        end
        
    always @ (posedge rf_bounced[3])
        begin
        if(rf_toggled[3] == 1'b1)
            rf_toggled[3] <= 1'b0;
        else
            rf_toggled[3] <= 1'b1;
        end
        
    always @ (posedge limit_bounced[0])
        begin
        if(limit_toggled[0] == 1'b1)
            limit_toggled[0] <= 1'b0;
        else
            limit_toggled[0] <= 1'b1;
        end
        
    always @ (posedge limit_bounced[1])
        begin
        if(limit_toggled[1] == 1'b1)
            limit_toggled[1] <= 1'b0;
        else
            limit_toggled[1] <= 1'b1;
        end
    
    // The state machine that controls which 
    // signal on the stepper motor is high.      
    pmod_step_driver control(
        .rst(rst),
        .dir(rf_toggled[0]),
        .clk(new_clk_net),
        .en(rf_toggled[1]),
        .signal(signal_out)
        );
        
    pmod_second_driver second_control(
        .rst(rst),
        .dir(rf_toggled[2]),
        .clk(new_clk_net),
        .en(rf_toggled[3]),
        .signal(second_signal)
        );
        
    
endmodule
