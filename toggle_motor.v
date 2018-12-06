`timescale 1ns / 1ps

module toggle_motor(
    input  rf,
    input  sw,
    output out
    );
    
    reg mem;
    
    always @(posedge rf or posedge sw)
    begin
        if (sw == 1)
            if (mem == 1)
                mem <= 0;
        else 
            if (rf == 1)
                if (mem == 1)
                    mem <= 0;
                else
                    mem <= 1;
    end

    assign out = mem;
    
endmodule
