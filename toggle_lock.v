`timescale 1ns / 1ps

module toggle_lock(
    input clk,
    input reset,
    input in,
    output out
    );

    reg mem;
    wire t;
    debounceplz db(clk, resest, in,t);
        
    always @(posedge t)
    begin
        if (mem == 0)
            mem <= 1;
        else
            mem <= 0;
    end
    
    assign out = mem;
       
endmodule
