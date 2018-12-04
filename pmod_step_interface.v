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
    input rf_input [3:0],
    input limit_switches [1:0].
    output [3:0] signal_out,
    output [3:0] second_signal
    );
    
    // Wire to connect the clock signal 
    // that controls the speed that the motor
    // steps from the clock divider to the 
    // state machine. 
    wire new_clk_net;

    // The wires for controlling direction and stepper enable
    wire direction [1:0];
    wire enable [1:0];
 
    // Clock Divider to take the on-board clock
    // to the desired frequency.
    clock_div clock_Div(
        .clk(clk),
        .rst(rst),
        .new_clk(new_clk_net)
        );
    
    //TODO Toggle-Lock Module (eventually incorperate limit switches!)
    toggle_direction1 toggle_lock(rf_input[0], direction[0]) 
    toggle_direction2 toggle_lock(rf_input[1], direction[1]) 

    toggle_motor1 toggle_motor(rf_input[2], limit_switches[0], enable[0]) 
    toggle_motor2 toggle_motor(rf_input[3], limit_switches[1], enable[1]) 

    
    // The state machine that controls which 
    // signal on the stepper motor is high.      
    pmod_step_driver control(
        .rst(rst),
        .dir(direction[1]),
        .clk(new_clk_net),
        .en(enable[1]),
        .signal(signal_out)
        );
        
    pmod_second_driver second_control(
        .rst(rst),
        .dir(direction[0]),
        .clk(new_clk_net),
        .en(enable[0]),
        .signal(second_signal)
        );
        
    
endmodule
