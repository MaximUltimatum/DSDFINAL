`timescale 1ns / 1ps

module toggle_motor(
    input clk,
    input reset,
    input  rf,
    input  sw,
    output out
    );
    
    reg mem;
    wire db_rf;
    wire db_sw;
    
    debounceplz db(clk, reset, rf, db_rf);
    debounceplz db2(clk, reset, sw, db_sw);    
    
    always @(posedge db_rf or posedge db_sw )
    begin
        if (db_sw == 1)
            if (mem == 1)
                mem <= 0;
        else 
            if (db_rf == 1)
                if (mem == 1)
                    mem <= 0;
                else
                    mem <= 1;
    end

    assign out = mem;
    
endmodule
