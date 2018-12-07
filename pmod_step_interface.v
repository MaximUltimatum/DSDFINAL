`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Target Devices: Basys3
//
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
    input clk,
    input rst,
    input [3:0] rf_input,
    input [1:0] limit,
    output [3:0] signal_out,
    output [3:0] second_signal
    );

    // Wire to connect the clock signal
    // that controls the speed that the motor
    // steps from the clock divider to the
    // state machine.
    wire new_clk_net;    
    wire [1:0] enabled;
    wire [1:0] direction;

    // Clock Divider to take the on-board clock
    // to the desired frequency.
    clock_div clock_Div(
        .clk(clk),
        .rst(rst),
        .new_clk(new_clk_net)
        );

    //TODO Toggle-Lock Module (eventually incorperate limit switches!)
    toggle_lock toggle_direction1 (clk, rst, rf_input[0], direction[0]);
    toggle_lock toggle_direction2 (clk, rst, rf_input[1], direction[1]);

    toggle_motor toggle_motor1(clk, rst, rf_input[2], limit[0], enabled[0]);
    toggle_motor toggle_motor2(clk, rst, rf_input[3], limit[1], enabled[1]);


    // The state machine that controls which
    // signal on the stepper motor is high.
    pmod_step_driver control(
        .rst(rst),
        .dir(direction[0]),
        .clk(new_clk_net),
        .en(enabled[0]),
        .signal(signal_out)
        );

    pmod_second_driver second_control(
        .rst(rst),
        .dir(direction[1]),
        .clk(new_clk_net),
        .en(enabled[1]),
        .signal(second_signal)
        );


endmodule
