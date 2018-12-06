`timescale 1ns / 1ps

module toggle_lock(
    input in,
    output out
    );

    reg mem;
    
        
    always @(posedge in)
    begin
        if (mem == 0)
            mem <= 1;
        else
            mem <= 0;
    end
    
    assign out = mem;
       
endmodule
